import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/backend/services/files_upload_api.dart';
import 'package:nyaya_tech/components/menu_item.dart';
import 'package:nyaya_tech/data_components/delete_component.dart';
import 'package:nyaya_tech/data_components/error_snackbar.dart';
import 'package:nyaya_tech/data_components/file_component.dart';
import 'package:nyaya_tech/data_components/get_routing.dart';
import 'package:nyaya_tech/data_components/shared_prefernce.dart';
import 'package:nyaya_tech/dtos/file_upload_dto.dart';
import 'package:nyaya_tech/pages/login_page/files/files_model.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_theme.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
import 'package:nyaya_tech/index.dart';
import 'package:nyaya_tech/response/caes_dox_response.dart';
import 'package:nyaya_tech/response/s3_upload_respons.dart';
import 'package:popover/popover.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:http/http.dart' as http;

class FilesWidget extends StatefulWidget {
  const FilesWidget({super.key});

  @override
  State<FilesWidget> createState() => _FilesWidgetState();
}

class _FilesWidgetState extends State<FilesWidget> {
  late FilesModel _model;
  int page = 1;
  int limit = 20;
  final ScrollController _scrollController = ScrollController();
  bool ishasMoreLoading = false;
  bool isFetchingData = false;
  bool refreshLoading = false;
  bool hasMore = true;
  List<Documents> caseDox = [];
  FilePickerResult? result;
  late Future<void> _future;
  bool fileUploadCameraProgress = false;
  bool fileUploadProgress = false;
  bool isUploading=false;
  bool isLoading=false;
  String uploadMessage="";

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FilesModel());
    _scrollController.addListener(_loadMoreItems);
    _future = fetchdata();
  }

  void _loadMoreItems() {
    if (isFetchingData || _model.current_page >= _model.total_pages) {
      return;
    }

    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      setState(() {
        isFetchingData = true;
        ishasMoreLoading = true;
      });
      page += 1;
      fetchdata().then((_) {
        setState(() {
          isFetchingData = false;
          ishasMoreLoading = false;
        });
      }).catchError((error) {
        setState(() {
          isFetchingData = false;
          ishasMoreLoading = false;
        });
      });
    }
  }

  Future<void> fetchdata() async {
    await _model.fetchDocx(page: page, limit: limit);
  }

  Future<void> _refreshDox(BuildContext context) async {
    setState(() {
      refreshLoading = true;
      page = 1;
      hasMore = true;
    });
    try {
      var newData = await fetchdata();
      caseDox.clear();
      setState(() {
        caseDox.addAll(_model.documents);
        refreshLoading = false;
      });
      return newData;
    } catch (e) {}
    setState(() {
      refreshLoading = false;
    });
  }


Future<void> _uploadFile({XFile?file}) async {
    try {
      setState(() {
        isUploading = true;
        isLoading = true;
        uploadMessage = "";
      });

      final selectedFiles = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: true,
      );

      if (selectedFiles != null && selectedFiles.files.isNotEmpty) {
        for (PlatformFile file in selectedFiles.files) {
          setState(() => uploadMessage = "Uploading ${file.name}...");

          Uint8List? fileBytes =
              file.bytes ?? await File(file.path!).readAsBytes();
          String base64Content = base64Encode(fileBytes);

          FileUploadDto fileUploadObject = FileUploadDto(
            fileType: file.extension ?? 'unknown',
            fileName: file.name,
            fileSize: file.size,
            fileContent: base64Content,
          );

          CustomResponse<S3UploadResponse> response =
              await FilesUploadApi().call(fileDto: fileUploadObject);

          if (response.statusCode == 200 || response.statusCode == 201) {
            String s3Url = response.data!.data!.targetUrl.toString();
            String fileKey = response.data!.data!.fileKey.toString();

            SharedPrefernce.setfileKey(fileKey);
            SharedPrefernce.sets3Url(s3Url);

            bool isUpdated =
                await _updateS3Url(s3Url, fileBytes, file.extension);

            await _model.fetchUploadKey(
              // case_id: SharedPrefernce.getcaseId(),
              fileType: file.extension ?? '--',
              // stage: "Case Filing",
              // sub_stage: "Signing",
              fileName: file.name,
              fileSize: file.size,
              key: fileKey,
            );

            setState(() {
              uploadMessage = isUpdated
                  ? "${file.name} uploaded successfully!"
                  : "${file.name} uploaded but failed to update S3.";
            });
          }
        }
        isLoading=true;
        await fetchdata();
        // await fetchData(); // Refresh the list after upload
      }
    } catch (e) {
      setState(() => uploadMessage = "Error uploading file: $e");
    } finally {
      setState(() {
        isUploading = false;
        isLoading = false;
      });
    }
  }

  String _getMimeType(String? extension) {
    switch (extension?.toLowerCase()) {
      case 'jpg':
      case 'jpeg':
        return 'image/jpeg';
      case 'png':
        return 'image/png';
      case 'pdf':
        return 'application/pdf';
      case 'doc':
        return 'application/msword';
      case 'docx':
        return 'application/vnd.openxmlformats-officedocument.wordprocessingml.document';
      default:
        return 'application/octet-stream';
    }
  }

  Future<bool> _updateS3Url(
      String s3Url, Uint8List fileContent, String? fileExtension) async {
    try {
      final response = await http.put(
        Uri.parse(s3Url),
        headers: {'Content-Type': _getMimeType(fileExtension)},
        body: fileContent,
      );
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }




  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        floatingActionButton: Container(
          height: 50,
          width: 50,
          child: Builder(
            builder: (context) => FloatingActionButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.zero)),
              onPressed: () {
                showPopover(
                    context: context,
                    bodyBuilder: (context) => Container(
                          padding: EdgeInsets.only(top: 30, bottom: 20),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              MenuItem(
                                text: 'Case Details',
                                color: Colors.white.withOpacity(0.5),
                                ontap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.fade,
                                      child: ViewCaseWidget(),
                                    ),
                                  );
                                },
                              ),
                              MenuItem(
                                  text: 'Files',
                                  color: Colors.white,
                                  ontap: () {}),
                              // MenuItem(
                              //     text: 'List of Documents',
                              //     color: Colors.white.withOpacity(0.5),
                              //     ontap: () {
                              //       Get.back();
                              //       Navigator.push(
                              //         context,
                              //         PageTransition(
                              //             type: PageTransitionType.fade,
                              //             child: ListofchecklistWidget()),
                              //       );
                              //     }),
                              MenuItem(
                                text: 'Chat Box',
                                color: Colors.white.withOpacity(0.5),
                                ontap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.fade,
                                      child: ChatBoxWidget(),
                                    ),
                                  );
                                },
                              ),
                              MenuItem(
                                text: 'Notes',
                                color: Colors.white.withOpacity(0.5),
                                ontap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.fade,
                                      child: NotesScreenWidget(),
                                    ),
                                  );
                                },
                              ),
                              MenuItem(
                                text: 'Hearing Summary',
                                color: Colors.white.withOpacity(0.5),
                                ontap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.fade,
                                      child: HearingSummaryWidget(),
                                    ),
                                  );
                                },
                              ),
                              // MenuItem(
                              //   text: 'Logs',
                              //   color: Colors.white.withOpacity(0.5),
                              //   ontap: () {
                              //     Navigator.pushReplacement(
                              //       context,
                              //       PageTransition(
                              //         type: PageTransitionType.fade,
                              //         child: LogsWidget(),
                              //       ),
                              //     );
                              //   },
                              // ),
                            ].divide(SizedBox(height: 16)),
                          ),
                        ),
                    direction: PopoverDirection.right,
                    width: 250,
                    height: 230,
                    arrowHeight: 15,
                    arrowWidth: 30,
                    backgroundColor: Colors.black);
              },
              backgroundColor: Colors.black,
              elevation: 8,
              child: Icon(Icons.menu_rounded, color: Colors.white, size: 32),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.bottombar,
                            arguments: {'currentIndex': 2});
                      },
                      child: InkWell(
                        onTap: () {
                          Get.offNamed(Routes.viewcase);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).secondaryBackground,
                            border: Border.all(color: Colors.black, width: 1),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(Icons.arrow_back,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'Files',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'DM Sans',
                            color: Color(0xFF181616),
                            fontSize: 16,
                            letterSpacing: 0,
                            lineHeight: 1.6,
                          ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        border: Border.all(color: Colors.black, width: 1),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Icon(Icons.help_outline_rounded,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SharedPrefernce.getcasesStatus() != 'CLOSURE'
                        ? Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  // setState(() {
                                  //   fileUploadCameraProgress = true;
                                  //   fileUploadProgress = true;
                                  //   _model.fileUploadProgress = true;
                                  // });

                                  // result = await FilePicker.platform.pickFiles(
                                  //   allowMultiple: true,
                                  //   type: FileType.any,
                                  // );

                                  // if (result != null) {
                                  //   List<XFile> files2 = result!.paths
                                  //       .map((path) => XFile(path!))
                                  //       .toList();
                                  //   var maxImages = min(files2.length, 5);

                                  //   for (var i = 0; i < maxImages; i++) {
                                  //     await _uploadFile(file: files2[i]);
                                  //   }
                                  // }

                                  // setState(() {
                                  //   fileUploadCameraProgress = false;
                                  //   fileUploadProgress = false;
                                  //   _model.fileUploadProgress = false;
                                  // });

                                  // await fetchdata();
                                  _uploadFile();
                                },
                                child: Container(
                                  decoration:
                                      BoxDecoration(color: Colors.black),
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (isUploading)
                                SizedBox(
                                  width: 18,
                                  height: 18,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                )
                              else
                                Icon(Icons.add, color: Colors.white, size: 18),
                              SizedBox(
                                  width:
                                      8), // Spacing between icon/loading and text
                              Text(
                                isUploading ? 'Uploading...' : 'Upload',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'DM Sans',
                                      color: Colors.white,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.w400,
                                    ),
                              ),
                            ],
                          ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Container(),
                  ],
                ),
                fileUploadProgress == true &&
                        _model.fileUploadProgress == true &&
                        fileUploadCameraProgress == true
                    ? Padding(
                        padding: const EdgeInsets.only(top: 200),
                        child: Center(
                            child: Lottie.asset(
                                'assets/lottie_animations/loading_animation.json',
                                width: 150,
                                height: 150)),
                      )
                    : Expanded(
                        child: FutureBuilder(
                            future: _future,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                    child: Lottie.asset(
                                        'assets/lottie_animations/loading_animation.json',
                                        width: 150,
                                        height: 150));
                              } else if (snapshot.hasError) {
                                return Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/images/No_internet1.svg',
                                        height: 100,
                                        width: 100,
                                      ),
                                      Text('No-Connection',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500))
                                    ],
                                  ),
                                );
                              } else {
                                return _model.documents.isNotEmpty
                                    ? Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 50),
                                        child: RefreshIndicator(
                                          onRefresh: () => _refreshDox(context),
                                          child: Skeletonizer(
                                            enabled: refreshLoading,
                                            child: GridView.builder(
                                              controller: _scrollController,
                                              physics:
                                                  const AlwaysScrollableScrollPhysics(),
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 2),
                                              itemCount:
                                                  _model.documents.length,
                                              itemBuilder: (context, index) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  child: FileComponent(
                                                    doc:
                                                        _model.documents[index],
                                                    delete: () async {
                                                      await showDialog(
                                                          context: context,
                                                          builder: (_) {
                                                            return DeletepopupWidget(
                                                                delat:
                                                                    () async {
                                                              await _model
                                                                  .fetchDeleatdox();
                                                              if (!_model
                                                                      .error &&
                                                                  _model.message
                                                                      .isNotEmpty) {
                                                                Navigator.pushReplacement(
                                                                    context,
                                                                    MaterialPageRoute(builder:
                                                                        (BuildContext
                                                                            context) {
                                                                  return FilesWidget();
                                                                }));
                                                                errorSnackBar(
                                                                    context,
                                                                    _model
                                                                        .message);
                                                              }
                                                            });
                                                          });
                                                    },
                                                  ),
                                                );
                                              },
                                            )
                                                .animate()
                                                .fade(
                                                    curve: Curves.easeInOut,
                                                    delay: 0.ms,
                                                    duration: 700.ms,
                                                    begin: 0,
                                                    end: 1)
                                                .slideY(begin: 0.3, end: 0.0),
                                          ),
                                        ),
                                      )
                                    : Center(
                                        child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            'assets/images/No_Files1.svg',
                                            height: 100,
                                            width: 100,
                                          ),
                                          Text('No-Files')
                                        ],
                                      ));
                              }
                            })),
                if (ishasMoreLoading)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Center(
                        child: CircularProgressIndicator(color: Colors.black)),
                  )
              ].divide(SizedBox(height: 24)),
            ),
          ),
        ),
      ),
    );
  }
}

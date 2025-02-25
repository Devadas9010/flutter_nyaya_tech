import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:nyaya_tech/data_components/error_snackbar.dart';
import 'package:nyaya_tech/data_components/genric_text_field.dart';
import 'package:nyaya_tech/data_components/shared_prefernce.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_button.dart';
import 'package:nyaya_tech/pages/login_page/chat_box/chat_box_model.dart';
import 'package:nyaya_tech/pages/login_page/chat_box/comment_box.dart';
import 'package:nyaya_tech/data_components/get_routing.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_theme.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
import 'package:nyaya_tech/providers/comments_provider.dart';
import 'package:nyaya_tech/response/get_comments_response.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class newCount extends StatelessWidget {
  const newCount({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text('${context.watch<CommentsProvider>().taskcommentsData.length}',
        key: const Key('counterState'),
        style: Theme.of(context).textTheme.headlineMedium);
  }
}

class ChatBoxWidget extends StatefulWidget {
  const ChatBoxWidget({super.key});

  @override
  State<ChatBoxWidget> createState() => _ChatBoxWidgetState();
}

class _ChatBoxWidgetState extends State<ChatBoxWidget> {
  late ChatBoxModel _model;
  TextEditingController commentController = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late Future<void> _future;
  int page = 1;
  int limit = 20;
  final ScrollController _scrollController = ScrollController();
  bool ishasMoreLoading = false;
  bool isFetchingData = false;
  int? selectedCommentId;
  int? userid;
  bool refreshLoading = false;
  bool hasMore = true;
  List<Commentdata> commentDatare = [];
  FilePickerResult? result;
  bool isattachmentLoading = false;
  bool isViewAll = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatBoxModel());
    _future = fetchCommentsData();
    _scrollController.addListener(_loadMoreItems);
  }

  Future<void> _refreshChat(BuildContext context) async {
    setState(() {
      refreshLoading = true;
      page = 1;
      hasMore = true;
    });
    try {
      var newData = await fetchCommentsData();
      commentDatare.clear();
      setState(() {
        commentDatare.addAll(_model.commentData);
        refreshLoading = false;
      });
      return newData;
    } catch (e) {}
    setState(() {
      refreshLoading = false;
    });
  }

  void showDeleteIcon(int commentId) {
    setState(() {
      selectedCommentId = commentId;
    });
  }

  void hideDelete() {
    setState(() {
      userid = null;
    });
  }

  void hideDeleteIcon() {
    setState(() {
      selectedCommentId = null;
    });
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

      fetchCommentsData().then((_) {
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

  Future<void> fetchCommentsData() async {
    final List<Commentdata> currentComments =
        await _model.fetchcomments(page: page, limit: limit);
    context.read<CommentsProvider>().setTaskCommentData(currentComments);
  }

  Map<String, List<Commentdata>> groupCommentsByDate(
      List<Commentdata> comments) {
    final Map<String, List<Commentdata>> groupedComments = {};

    final DateTime now = DateTime.now();
    final DateTime today = DateTime(now.year, now.month, now.day);
    final DateTime yesterday = today.subtract(Duration(days: 1));

    for (var comment in comments) {
      final commentDate = DateTime(
        comment.createdAt!.year,
        comment.createdAt!.month,
        comment.createdAt!.day,
      );
      String key;
      if (commentDate == today) {
        key = "Today";
      } else if (commentDate == yesterday) {
        key = "Yesterday";
      } else {
        key = DateFormat('MMM d, yyyy').format(commentDate);
      }
      if (!groupedComments.containsKey(key)) {
        groupedComments[key] = [];
      }
      groupedComments[key]!.add(comment);
    }

    groupedComments.forEach((key, value) {
      value.sort((a, b) => a.createdAt!.compareTo(b.createdAt!));
    });
    return groupedComments;
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
      child: GestureDetector(
        onTap: () {
          if (selectedCommentId != null) {
            hideDeleteIcon();
          }
        },
        child: SafeArea(
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Color(0XFFF4F8FE),
            body: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.viewcase);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
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
                      Text(
                        'Chat Box',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'DM Sans',
                            color: Color(0xFF181616),
                            fontSize: 16,
                            letterSpacing: 0,
                            lineHeight: 1.6),
                      ),
                      InkWell(
                        onTap: () => _refreshChat(context),
                        child: Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            border: Border.all(color: Colors.black, width: 1),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(Icons.refresh,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (ishasMoreLoading)
                  Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: CircularProgressIndicator(
                          color: Colors.black, strokeWidth: 2)),
                Expanded(
                  child: FutureBuilder(
                    future: _future,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                            child: Lottie.asset(
                                'assets/lottie_animations/loading_animation.json',
                                width: 150,
                                height: 150));
                      } else if (context
                          .watch<CommentsProvider>()
                          .taskcommentsData
                          .isNotEmpty) {
                        final groupedComments = groupCommentsByDate(
                          context.watch<CommentsProvider>().taskcommentsData,
                        );
                        return Skeletonizer(
                          enabled: refreshLoading,
                          child: ListView(
                            reverse: true,
                            controller: _scrollController,
                            children: groupedComments.entries.map((entry) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 16),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          entry.key,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                              color: Color(0XFF898989)),
                                        ),
                                      ].divide(SizedBox(width: 8)),
                                    ),
                                  ),
                                  ...entry.value.map((comment) {
                                    return Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: InkWell(
                                          onLongPress: () async {
                                            if (comment.userId ==
                                                SharedPrefernce
                                                    .getprofileid()) {
                                              SharedPrefernce.setcommentId(
                                                  comment.id!.toInt());
                                              showDeleteIcon(comment.id!);
                                            }
                                          },
                                          child: Stack(
                                            children: [
                                              Padding(
                                                  padding: EdgeInsets.all(0),
                                                  child: CommentBox(
                                                      commentData: comment)),
                                              if (selectedCommentId ==
                                                      comment.id &&
                                                  comment.userId ==
                                                      SharedPrefernce
                                                          .getprofileid())
                                                Positioned(
                                                    top: 10,
                                                    left: 40,
                                                    child: Material(
                                                        color:
                                                            Colors.transparent,
                                                        child: InkWell(
                                                          onTap: () async {
                                                            await _model
                                                                .fetectDeleteComment();
                                                            errorSnackBar(
                                                                context,
                                                                _model.message);
                                                            hideDeleteIcon();
                                                            fetchCommentsData();
                                                          },
                                                          child: Icon(
                                                              Icons
                                                                  .delete_outline,
                                                              color: Colors.red,
                                                              size: 24),
                                                        )))
                                            ],
                                          )),
                                    );
                                  }).toList(),
                                ],
                              );
                            }).toList(),
                          ),
                        );
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
                        return Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset("assets/images/No_chats1.svg",
                                  height: 100, width: 100),
                              const Text("No Chat yet"),
                            ].divide(SizedBox(height: 8)),
                          ),
                        );
                      }
                    },
                  ),
                ),
                SharedPrefernce.getcasesStatus() != 'CLOSURE'
                    ? Container(
                        color: Color(0XFFF7F9FB),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Divider(
                                thickness: 2,
                                color: FlutterFlowTheme.of(context).alternate),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 6, 16, 16),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        // GestureDetector(
                                        //   onTap: () async {
                                        //     result =
                                        //         await FilePicker.platform.pickFiles(
                                        //       allowMultiple: true,
                                        //       type: FileType.any,
                                        //     );
                                        //     if (result != null) {
                                        //       List<XFile> files2 = result!.paths
                                        //           .map((path) => XFile(path!))
                                        //           .toList();

                                        //       var maxImages = min(files2.length, 5);
                                        //       setState(() {
                                        //         isattachmentLoading = true;
                                        //         isViewAll = false;
                                        //       });
                                        //       for (var i = 0; i < maxImages; i++) {
                                        //         await _model.uploadFile(
                                        //             file: files2[i]);
                                        //         await _model.fetchattachmentsUpload();
                                        //         if (_model.error &&
                                        //             _model.message.isNotEmpty) {
                                        //           errorSnackBar(
                                        //               context, _model.message);
                                        //         }
                                        //       }
                                        //       setState(() {
                                        //         isattachmentLoading = false;
                                        //       });
                                        //       if (!_model.error &&
                                        //           _model.message.isNotEmpty) {
                                        //         Navigator.pushReplacement(
                                        //           context,
                                        //           MaterialPageRoute(
                                        //               builder: (context) =>
                                        //                   ChatBoxWidget()),
                                        //         );
                                        //       }
                                        //       setState(() {
                                        //         isViewAll = true;
                                        //       });
                                        //     } else {}
                                        //   },
                                        //   child: Icon(Icons.image_outlined,
                                        //       color: FlutterFlowTheme.of(context)
                                        //           .primaryText,
                                        //       size: 24),
                                        // ),
                                        Expanded(
                                          child: CommentTextField(
                                              minLine: 1,
                                              maxLine: 2,
                                              controller: commentController,
                                              hintText: 'Type Message'),
                                        ),
                                      ].divide(SizedBox(width: 8)),
                                    ),
                                  ),
                                  FlutterFlowIconButton(
                                    showLoadingIndicator: true,
                                    borderRadius: 4,
                                    buttonSize: 48,
                                    fillColor: Colors.black,
                                    icon: Icon(Icons.send_rounded,
                                        color: Colors.white, size: 24),
                                    onPressed: () async {
                                      if (commentController.text
                                          .trim()
                                          .isEmpty) {
                                        return;
                                      }
                                      await _model.fetchPostComments(
                                          caseid: SharedPrefernce.getcaseId(),
                                          comments:
                                              commentController.text.trim(),
                                          type: 'MESSAGES');
                                      setState(() {});
                                      await fetchCommentsData();
                                      setState(() {});
                                      commentController.text = '';
                                    },
                                  ),
                                ].divide(SizedBox(width: 8)),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(),
              ].divide(SizedBox(height: 24)),
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:convert';
import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nyaya_tech/backend/custom_response.dart';
import 'package:nyaya_tech/backend/services/files_upload_api.dart';
import 'package:http/http.dart' as http;
import 'package:nyaya_tech/data_components/date_component.dart';
import 'package:nyaya_tech/data_components/email_field.dart';
import 'package:nyaya_tech/data_components/error_snackbar.dart';
import 'package:nyaya_tech/data_components/get_routing.dart';
import 'package:nyaya_tech/data_components/lines_text_filed.dart';
import 'package:nyaya_tech/data_components/shared_prefernce.dart';
import 'package:nyaya_tech/data_components/text_field_component.dart';
import 'package:nyaya_tech/dtos/file_upload_dto.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_animation.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_theme.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_widgets.dart';
import 'package:nyaya_tech/pages/login_page/add_profile/add_profile_model.dart';
import 'package:nyaya_tech/response/s3_upload_respons.dart';

class AddUserWidget extends StatefulWidget {
  const AddUserWidget({super.key});

  @override
  State<AddUserWidget> createState() => _AddUserWidgetState();
}

class _AddUserWidgetState extends State<AddUserWidget> {
  late AddUserModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  TextEditingController controller5 = TextEditingController();
  TextEditingController controller6 = TextEditingController();
  TextEditingController controller7 = TextEditingController();
  TextEditingController controller8 = TextEditingController();
  String date = '';
  String selectedGender = '';
  bool showGenderError = false;
  bool isLoading = false;
  final animationsMap = <String, AnimationInfo>{};
  final List<String> items = ["Andhra Pradesh", "Telangana"];
  String selectedValue = '';
  final List<String> qulification = [
    "Pre-Graduation",
    "UG",
    "PG",
    "PGDM",
    "PHD",
    "Others"
  ];
  String selectQulification = '';
  final List<String> Occupation = [
    "Public sector",
    "Private sector",
    "Self-employed"
  ];
  String selectoccupation = '';

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddUserModel());
    controller4.text = SharedPrefernce.getcreatePhone();
    controller1.text = SharedPrefernce.getfirstName();
    controller2.text = SharedPrefernce.getsecondName();
    selectedGender = SharedPrefernce.getgender();
    selectedValue = SharedPrefernce.getstates();
    animationsMap.addAll({
      'rowOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 700.0.ms,
            begin: Offset(0.0, 10.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 700.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'textOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 700.0.ms,
            begin: Offset(0.0, 20.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 700.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'textOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 700.0.ms,
            begin: Offset(0.0, 20.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 700.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 700.0.ms,
            begin: Offset(-20.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 700.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 700.0.ms,
            begin: Offset(20.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 700.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 700.0.ms,
            begin: Offset(0.0, 20.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 700.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 700.0.ms,
            begin: Offset(0.0, 20.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 700.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'columnOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 700.0.ms,
            begin: Offset(0.0, 20.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 700.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
  }

  FilePickerResult? result;

  Future<void> _uploadFile() async {
    try {
      setState(() {});

      result = await FilePicker.platform
          .pickFiles(type: FileType.image, allowMultiple: false);

      if (result != null && result!.files.isNotEmpty) {
        for (PlatformFile file in result!.files) {
          setState(() {});

          Uint8List? fileBytes;
          if (file.bytes != null) {
            fileBytes = file.bytes;
          } else if (file.path != null) {
            final pickedFile = File(file.path!);
            fileBytes = await pickedFile.readAsBytes();
          } else {
            setState(() {});
            continue;
          }

          String base64Content = base64Encode(fileBytes!);
          FileUploadDto fileUploadDto = FileUploadDto(
              fileType: file.extension ?? 'unknown',
              fileName: file.name,
              fileSize: file.size,
              fileContent: base64Content);

          try {
            CustomResponse<S3UploadResponse> response =
                await FilesUploadApi().call(fileDto: fileUploadDto);

            if (response.statusCode == 200 || response.statusCode == 201) {
              String s3Url = response.data!.data!.targetUrl.toString();
              String fileKey = response.data!.data!.fileKey.toString();
              SharedPrefernce.setfileKey(fileKey);
              SharedPrefernce.sets3Url(s3Url);
              await _model.fetchDownloadUrl(file: fileKey);

              bool isUpdated =
                  await _updateS3Url(s3Url, fileBytes, file.extension);

              if (isUpdated) {
                setState(() {});
              } else {
                setState(() {});
              }
              setState(() {});
            } else {
              setState(() {});
            }
          } catch (e) {
            debugPrint("Error uploading ${file.name}: $e");
            setState(() {});
          }
        }
      } else {
        setState(() {});
      }
    } catch (e) {
      debugPrint("Error during file upload: $e");
      setState(() {});
    } finally {
      setState(() {});
    }
  }

  String _getMimeType(String? extension) {
    switch (extension?.toLowerCase()) {
      case 'jpg':
      case 'jpeg':
        return 'image/jpeg';
      case 'png':
        return 'image/png';
      default:
        return 'application/octet-stream';
    }
  }

  Future<bool> _updateS3Url(
      String s3Url, Uint8List fileContent, String? fileExtension) async {
    try {
      final response = await http.put(
        Uri.parse(s3Url),
        headers: {
          'Content-Type': _getMimeType(fileExtension),
        },
        body: fileContent,
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        debugPrint("Failed to update S3 URL: ${response.body}");
        return false;
      }
    } catch (e) {
      debugPrint("Error in PUT request: $e");
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
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 10),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Opacity(
                        opacity: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          child: Icon(Icons.arrow_back,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 36),
                        ),
                      ),
                      Text(
                        'Edit Profile',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'DM Sans',
                              fontSize: 16,
                              letterSpacing: 0,
                            ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          if (SharedPrefernce.getfileKey() == "null" ||
                              SharedPrefernce.getfileKey() == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Profile picture is required."),
                                backgroundColor: Colors.red,
                              ),
                            );
                            return;
                          }

                          setState(() {
                            isLoading = true;
                          });
                          await _model.fetchUpdateUser(
                            userid: SharedPrefernce.getloginId(),
                            firstName: controller1.text.trim(),
                            lastName: controller2.text.trim(),
                            address: controller5.text.trim(),
                            phone: controller4.text.trim(),
                            dateofBirth: date.trim(),
                            gender: selectedGender,
                            profilePic: SharedPrefernce.getfileKey() == "null"
                                ? null
                                : SharedPrefernce.getfileKey(),
                            email: controller3.text.trim(),
                            state: selectedValue.toString(),
                            qualification: selectQulification,
                            occupation: selectoccupation,
                            bio: controller7.text.trim(),
                            aadhaar: controller8.text.trim(),
                          );

                          setState(() {
                            isLoading = false;
                          });

                          if (_model.error &&
                              _model.message.isNotEmpty &&
                              !_model.isValidation) {
                            return;
                          } else if (!_model.error &&
                              _model.message.isNotEmpty) {
                            Get.toNamed(Routes.bottombar,
                                arguments: {'currentIndex': 3});
                          } else if (selectedGender.isEmpty) {
                            setState(() {
                              showGenderError = true;
                            });
                          }
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(0),
                          child: isLoading
                              ? SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                      color: Colors.black, strokeWidth: 2),
                                )
                              : SvgPicture.asset('assets/images/done_mark.svg',
                                  width: 36, height: 36, fit: BoxFit.cover),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(0),
                            child: _model.data != null
                                ? Image.network(
                                    _model.data!.downloadUrl.toString(),
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  )
                                : SvgPicture.asset(
                                    'assets/images/no_Profile_user.svg',
                                    fit: BoxFit.cover,
                                    width: 97,
                                    height: 97,
                                  ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0, 1),
                            child: FFButtonWidget(
                              onPressed: () {
                                _uploadFile();
                              },
                              text: 'Change',
                              options: FFButtonOptions(
                                height: 30,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 0, 16, 0),
                                iconPadding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                color: Color(0xFFEAEAEA),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'DM Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 14,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                elevation: 0,
                                borderSide: BorderSide(
                                  color: Color(0xFFE0E0E0),
                                ),
                                borderRadius: BorderRadius.circular(0),
                              ),
                            ),
                          ),
                        ].divide(SizedBox(width: 12)),
                      ).animateOnPageLoad(
                          animationsMap['rowOnPageLoadAnimation']!),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            child: TextFieldComponent(
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[a-z A-Z\s]'))
                              ],
                              controller: controller1,
                              errorKey: 'first_name',
                              errors: _model.errorInstance,
                              hintText: 'First Name',
                              label: 'First Name *',
                              maxLine: 1,
                            ),
                          ),
                          Flexible(
                            child: TextFieldComponent(
                                controller: controller2,
                                hintText: 'Last Name',
                                label: 'Last Name *',
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[a-z A-Z\s]'))
                                ],
                                errors: _model.errorinstance3,
                                maxLine: 1,
                                errorKey: 'last_name'),
                          ),
                        ].divide(SizedBox(width: 16)),
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation1']!),
                      Flexible(
                        child: EmailFieldComponent(
                                controller: controller3,
                                errorKey: 'email',
                                errors: _model.errorinstance5,
                                hintText: 'Email',
                                label: 'Email *',
                                maxLine: 1)
                            .animateOnPageLoad(animationsMap[
                                'containerOnPageLoadAnimation3']!),
                      ),
                      Flexible(
                        child: TextFieldComponent(
                                controller: controller4,
                                hintText: 'Phone',
                                label: 'Phone *',
                                maxLine: 1,
                                errors: _model.errorInstance1,
                                errorKey: 'phone')
                            .animateOnPageLoad(animationsMap[
                                'containerOnPageLoadAnimation3']!),
                      ),
                      Flexible(
                        child: TextFieldComponent(
                                controller: controller8,
                                textInputType: TextInputType.number,
                                maxLength: 12,
                                hintText: 'Aadhaar',
                                label: 'Aadhaar *',
                                inputFormatters: [],
                                maxLine: 1,
                                errors: _model.aaddharerror,
                                errorKey: 'aadhaar')
                            .animateOnPageLoad(animationsMap[
                                'containerOnPageLoadAnimation3']!),
                      ),
                      Flexible(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Qualification *',
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(height: 8),
                            DropdownButtonHideUnderline(
                              child: DropdownButton2<String>(
                                isExpanded: true,
                                hint: Text(
                                  'Please Select Qualification',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Theme.of(context).hintColor,
                                  ),
                                ),
                                items: qulification
                                    .map((String item) =>
                                        DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ))
                                    .toList(),
                                value: selectQulification.isEmpty
                                    ? null
                                    : selectQulification,
                                onChanged: (String? value) {
                                  setState(() {
                                    selectQulification = value ?? '';
                                  });
                                },
                                buttonStyleData: ButtonStyleData(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0),
                                      border: Border.all(color: Colors.black),
                                    )),
                                menuItemStyleData: const MenuItemStyleData(
                                  height: 40,
                                ),
                              ),
                            ),
                            SizedBox(height: 4),
                            if (_model.error && _model.message.isNotEmpty)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12),
                                    child: Text(
                                      _model.qulificationerror,
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Occupation *',
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(height: 8),
                            DropdownButtonHideUnderline(
                              child: DropdownButton2<String>(
                                isExpanded: true,
                                hint: Text(
                                  'Please Select Occupation',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Theme.of(context).hintColor,
                                  ),
                                ),
                                items: Occupation.map(
                                    (String item) => DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        )).toList(),
                                value: selectoccupation.isEmpty
                                    ? null
                                    : selectoccupation,
                                onChanged: (String? value) {
                                  setState(() {
                                    selectoccupation = value ?? '';
                                  });
                                },
                                buttonStyleData: ButtonStyleData(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0),
                                      border: Border.all(color: Colors.black),
                                    )),
                                menuItemStyleData: const MenuItemStyleData(
                                  height: 40,
                                ),
                              ),
                            ),
                            SizedBox(height: 4),
                            if (_model.error && _model.message.isNotEmpty)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12),
                                    child: Text(
                                      _model.occupationerror,
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: DescriptionTextField(
                          fillcolor: Color(0XFFffffff),
                          controller: controller5,
                          hintText: 'Residential Address',
                          color: Colors.black,
                          lable: 'Residential Address *',
                          errors: _model.addresserror,
                          errorKey: 'address',
                        ).animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation3']!),
                      ),
                      Flexible(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'State',
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(height: 8),
                            DropdownButtonHideUnderline(
                              child: DropdownButton2<String>(
                                isExpanded: true,
                                hint: Text(
                                  'Please Select State',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Theme.of(context).hintColor,
                                  ),
                                ),
                                items: items
                                    .map((String item) =>
                                        DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ))
                                    .toList(),
                                value: selectedValue.isEmpty
                                    ? null
                                    : selectedValue,
                                onChanged: (String? value) {
                                  setState(() {
                                    selectedValue = value ?? '';
                                  });
                                },
                                buttonStyleData: ButtonStyleData(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0),
                                      border: Border.all(color: Colors.black),
                                    )),
                                menuItemStyleData: const MenuItemStyleData(
                                  height: 40,
                                ),
                              ),
                            ),
                            SizedBox(height: 4),
                            if (_model.error && _model.message.isNotEmpty)
                              Text(
                                _model.stateerror,
                                style:
                                    TextStyle(color: Colors.red, fontSize: 12),
                              ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: TextFeild_DatePicker(
                          firstDate: DateTime(1950),
                          lastDate: DateTime(2011),
                          initialDate: DateTime(2011),
                          lable: 'Date Of Birth *',
                          dateController: controller6,
                          dateCallback: (value) {
                            SharedPrefernce.setSummary(date = value);
                          },
                          errorKey: 'date_of_birth',
                          errors: _model.errorInstance2,
                        ).animateOnPageLoad(
                            animationsMap['columnOnPageLoadAnimation']!),
                      ),
                      Row(
                        children: [
                          Text(
                            'Gender *',
                            style: TextStyle(
                                fontFamily: 'DM Sans',
                                fontSize: 14,
                                color: Color(0XFF0C0C0C)),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _genderContainer('MALE', 'Male'),
                                _genderContainer('FEMALE', 'Female'),
                                _genderContainer('OTHER', 'Other'),
                              ],
                            ),
                            if (showGenderError) ...[
                              SizedBox(height: 4),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4),
                                    child: Text(
                                      _model.errorinstance4,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ].divide(SizedBox(height: 4)),
                        ).animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation3']!),
                      ),
                    ].divide(SizedBox(height: 16)),
                  ),
                  TextFieldComponent(
                          controller: controller7,
                          hintText: 'Bio',
                          label: 'Bio *',
                          maxLine: 1,
                          errors: _model.bioerror,
                          errorKey: 'bio')
                      .animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation3']!),
                ].divide(SizedBox(height: 32)),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _genderContainer(String gender, String label) {
    bool isSelected = selectedGender == gender;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedGender = gender;
          showGenderError = false;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          border: Border.all(
            color: isSelected ? Color(0XFFE0E0E0) : Colors.white,
          ),
          borderRadius: BorderRadius.circular(0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 10, 16, 10),
          child: Row(
            children: [
              Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: isSelected ? Colors.black : Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black, width: 2),
                ),
              ),
              SizedBox(width: 10),
              Text(
                label,
                style: FlutterFlowTheme.of(context)
                    .bodyMedium
                    .override(fontFamily: 'DM Sans', color: Color(0XFF181616)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

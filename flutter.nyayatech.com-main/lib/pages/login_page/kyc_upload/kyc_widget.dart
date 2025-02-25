// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:nyaya_tech/data_components/get_routing.dart';
// import 'package:nyaya_tech/data_components/shared_prefernce.dart';
// import 'package:nyaya_tech/flutter_flow/flutter_flow_theme.dart';
// import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
// import 'package:nyaya_tech/flutter_flow/flutter_flow_widgets.dart';
// import 'package:flutter/material.dart';
// import 'package:nyaya_tech/pages/login_page/kyc_upload/kyc_model.dart';

// class AadharWidget extends StatefulWidget {
//   const AadharWidget({super.key});

//   @override
//   State<AadharWidget> createState() => _AadharWidgetState();
// }

// class _AadharWidgetState extends State<AadharWidget> {
//   late AadharModel _model;

//   final scaffoldKey = GlobalKey<ScaffoldState>();
//   XFile? _uploadedImage;
//   XFile? _uploadedImage1;
//   bool fileUploadCameraProgress = false;
//   bool fileUploadProgress = false;

//   @override
//   void initState() {
//     super.initState();
//     _model = createModel(context, () => AadharModel());
//   }

//   Future<XFile?> _openGallery(
//       {ImageSource imageSource = ImageSource.gallery}) async {
//     final XFile? capturedImages =
//         await ImagePicker().pickImage(source: imageSource, imageQuality: 95);
//     return capturedImages;
//   }

//   Future<void> _handleFileUpload(XFile? file) async {
//     if (file != null) {
//       setState(() {
//         fileUploadCameraProgress = true;
//         fileUploadProgress = true;
//         _model.fileUploadProgress = true;
//       });
//       await _model.uploadFile(file: file);
//       setState(() {
//         _uploadedImage = file;
//         fileUploadCameraProgress = false;
//         fileUploadProgress = false;
//         _model.fileUploadProgress = false;
//       });
//     }
//   }

//   Future<void> _handleFileupload1(XFile? file1) async {
//     if (file1 != null) {
//       fileUploadCameraProgress = true;
//       fileUploadProgress = true;
//       _model.fileUploadProgress = true;
//       await _model.uploadFile1(file: file1);
//       setState(() {
//         _uploadedImage1 = file1;
//         fileUploadCameraProgress = false;
//         fileUploadProgress = false;
//         _model.fileUploadProgress = false;
//       });
//     }
//   }

//   @override
//   void dispose() {
//     _model.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         return false;
//       },
//       child: Scaffold(
//         key: scaffoldKey,
//         backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
//         body: SafeArea(
//           top: true,
//           child: Padding(
//             padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
//             child: Column(
//               mainAxisSize: MainAxisSize.max,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 InkWell(
//                   onTap: () {
//                     Navigator.pop(context);
//                   },
//                   child: Icon(Icons.arrow_back)),
//                 Text(
//                   'Verify Your Identity To Proceed With Your Case',
//                   style: FlutterFlowTheme.of(context).bodyMedium.override(
//                         fontFamily: 'DM Sans',
//                         color: Colors.black,
//                         fontSize: 16,
//                         letterSpacing: 0,
//                       ),
//                 ),
//                 _uploadedImage == null
//                     ? Column(
//                         mainAxisSize: MainAxisSize.max,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Column(
//                             mainAxisSize: MainAxisSize.max,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Upload Aadhaar',
//                                 style: FlutterFlowTheme.of(context)
//                                     .bodyMedium
//                                     .override(
//                                         fontFamily: 'DM Sans',
//                                         color: Colors.black,
//                                         letterSpacing: 0,
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w400),
//                               ),
//                               Container(
//                                 decoration: BoxDecoration(
//                                   color: FlutterFlowTheme.of(context)
//                                       .secondaryBackground,
//                                   border: Border.all(
//                                     color: Color(0xFFDBDBDB),
//                                   ),
//                                 ),
//                                 child: Padding(
//                                   padding: EdgeInsets.all(12),
//                                   child: Row(
//                                     mainAxisSize: MainAxisSize.max,
//                                     children: [
//                                       FFButtonWidget(
//                                         onPressed: () async {
//                                           final XFile? capturedImage =
//                                               await _openGallery(
//                                                   imageSource:
//                                                       ImageSource.gallery);
//                                           _handleFileUpload(capturedImage);
//                                         },
//                                         text: 'Choose File',
//                                         options: FFButtonOptions(
//                                           height: 40,
//                                           padding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   16, 0, 16, 0),
//                                           iconPadding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   0, 0, 0, 0),
//                                           color: Color(0xFFF3F3F3),
//                                           textStyle:
//                                               FlutterFlowTheme.of(context)
//                                                   .titleSmall
//                                                   .override(
//                                                       fontFamily: 'DM Sans',
//                                                       color: Colors.black,
//                                                       fontSize: 14,
//                                                       letterSpacing: 0,
//                                                       fontWeight:
//                                                           FontWeight.w400),
//                                           elevation: 0,
//                                           borderSide: BorderSide(
//                                             color: Color(0xFFBDBDBD),
//                                           ),
//                                           borderRadius:
//                                               BorderRadius.circular(0),
//                                         ),
//                                       ),
//                                       Text(
//                                         'No File Chosen',
//                                         style: FlutterFlowTheme.of(context)
//                                             .bodyMedium
//                                             .override(
//                                                 fontFamily: 'DM Sans',
//                                                 color: Colors.black,
//                                                 fontSize: 12,
//                                                 letterSpacing: 0,
//                                                 fontWeight: FontWeight.w400),
//                                       ),
//                                     ].divide(SizedBox(width: 12)),
//                                   ),
//                                 ),
//                               ),
//                             ].divide(SizedBox(height: 12)),
//                           ),
//                           FFButtonWidget(
//                             onPressed: () async {
//                               setState(() {
//                                 fileUploadProgress == true;
//                                 _model.fileUploadProgress == true;
//                                 fileUploadCameraProgress == true;
//                               });
//                               final XFile? image = await _openGallery(
//                                   imageSource: ImageSource.camera);
//                               _handleFileUpload(image);
//                               setState(() {
//                                 fileUploadProgress == false;
//                                 _model.fileUploadProgress == false;
//                                 fileUploadCameraProgress == false;
//                               });
//                             },
//                             text: 'Take Picture',
//                             icon: Icon(Icons.photo_camera_outlined,
//                                 color: FlutterFlowTheme.of(context)
//                                     .primaryBackground,
//                                 size: 18),
//                             options: FFButtonOptions(
//                               height: 40,
//                               padding:
//                                   EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
//                               iconPadding:
//                                   EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
//                               color: Color(0xFF828282),
//                               textStyle: FlutterFlowTheme.of(context)
//                                   .titleSmall
//                                   .override(
//                                       fontFamily: 'DM Sans',
//                                       color: Colors.white,
//                                       fontSize: 14,
//                                       letterSpacing: 0,
//                                       fontWeight: FontWeight.w400),
//                               elevation: 0,
//                               borderSide: BorderSide(
//                                 color: Color(0xFFBDBDBD),
//                               ),
//                               borderRadius: BorderRadius.circular(0),
//                             ),
//                           ),
//                         ].divide(SizedBox(height: 16)),
//                       )
//                     : Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Text('Aadhaar',
//                                   style: FlutterFlowTheme.of(context)
//                                       .bodyMedium
//                                       .override(
//                                           fontFamily: 'DM Sans',
//                                           color: Colors.black,
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.w400,
//                                           letterSpacing: 0)),
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 20),
//                                 child: Image.network(
//                                     SharedPrefernce.gets3Urlcam(),
//                                     width: 150,
//                                     height: 180),
//                               )
//                             ].divide(SizedBox(height: 8)),
//                           ),
//                         ],
//                       ),
//                 Expanded(
//                   child: _uploadedImage1 == null
//                       ? Column(
//                           mainAxisSize: MainAxisSize.max,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Column(
//                               mainAxisSize: MainAxisSize.max,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   'Upload Selfie',
//                                   style: FlutterFlowTheme.of(context)
//                                       .bodyMedium
//                                       .override(
//                                         color: Colors.black,
//                                         letterSpacing: 0,
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w400,
//                                         fontFamily: 'DM Sans',
//                                       ),
//                                 ),
//                                 Container(
//                                   decoration: BoxDecoration(
//                                     color: FlutterFlowTheme.of(context)
//                                         .secondaryBackground,
//                                     border: Border.all(
//                                       color: Color(0xFFDBDBDB),
//                                     ),
//                                   ),
//                                   child: Padding(
//                                     padding: EdgeInsets.all(12),
//                                     child: Row(
//                                       mainAxisSize: MainAxisSize.max,
//                                       children: [
//                                         FFButtonWidget(
//                                           onPressed: () async {
//                                             final XFile? capturedImage =
//                                                 await _openGallery(
//                                                     imageSource:
//                                                         ImageSource.gallery);
//                                             _handleFileupload1(capturedImage);
//                                           },
//                                           text: 'Choose File',
//                                           options: FFButtonOptions(
//                                             height: 40,
//                                             padding:
//                                                 EdgeInsetsDirectional.fromSTEB(
//                                                     16, 0, 16, 0),
//                                             iconPadding:
//                                                 EdgeInsetsDirectional.fromSTEB(
//                                                     0, 0, 0, 0),
//                                             color: Color(0xFFF3F3F3),
//                                             textStyle:
//                                                 FlutterFlowTheme.of(context)
//                                                     .titleSmall
//                                                     .override(
//                                                       fontFamily: 'DM Sans',
//                                                       color: Colors.black,
//                                                       fontSize: 14,
//                                                       letterSpacing: 0,
//                                                       fontWeight:
//                                                           FontWeight.normal,
//                                                     ),
//                                             elevation: 0,
//                                             borderSide: BorderSide(
//                                               color: Color(0xFFBDBDBD),
//                                             ),
//                                             borderRadius:
//                                                 BorderRadius.circular(0),
//                                           ),
//                                         ),
//                                         Text(
//                                           'No File Chosen',
//                                           style: FlutterFlowTheme.of(context)
//                                               .bodyMedium
//                                               .override(
//                                                 fontFamily: 'DM Sans',
//                                                 color: Colors.black,
//                                                 fontSize: 12,
//                                                 letterSpacing: 0,
//                                               ),
//                                         ),
//                                       ].divide(SizedBox(width: 12)),
//                                     ),
//                                   ),
//                                 ),
//                               ].divide(SizedBox(height: 12)),
//                             ),
//                             FFButtonWidget(
//                               onPressed: () async {
//                                 final XFile? image = await _openGallery(
//                                     imageSource: ImageSource.camera);
//                                 _handleFileupload1(image);
//                               },
//                               text: 'Take Picture',
//                               icon: Icon(
//                                 Icons.photo_camera_outlined,
//                                 color: FlutterFlowTheme.of(context)
//                                     .primaryBackground,
//                                 size: 18,
//                               ),
//                               options: FFButtonOptions(
//                                 height: 40,
//                                 padding: EdgeInsetsDirectional.fromSTEB(
//                                     16, 0, 16, 0),
//                                 iconPadding:
//                                     EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
//                                 color: Color(0xFF828282),
//                                 textStyle: FlutterFlowTheme.of(context)
//                                     .titleSmall
//                                     .override(
//                                       fontFamily: 'DM Sans',
//                                       color: Colors.white,
//                                       fontSize: 14,
//                                       letterSpacing: 0,
//                                       fontWeight: FontWeight.normal,
//                                     ),
//                                 elevation: 0,
//                                 borderSide: BorderSide(
//                                   color: Color(0xFFBDBDBD),
//                                 ),
//                                 borderRadius: BorderRadius.circular(0),
//                               ),
//                             ),
//                           ].divide(SizedBox(height: 16)),
//                         )
//                       : Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 Text('Selfie',
//                                     style: FlutterFlowTheme.of(context)
//                                         .bodyMedium
//                                         .override(
//                                             fontFamily: 'DM Sans',
//                                             fontSize: 16,
//                                             fontWeight: FontWeight.w400,
//                                             color: Colors.black,
//                                             letterSpacing: 0)),
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 20),
//                                   child: Image.network(
//                                       SharedPrefernce.gets3Urlfiles(),
//                                       width: 150,
//                                       height: 180),
//                                 )
//                               ].divide(SizedBox(height: 8)),
//                             ),
//                           ],
//                         ),
//                 ),
//                 Row(
//                   mainAxisSize: MainAxisSize.max,
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     FFButtonWidget(
//                       onPressed: () {
//                         SharedPrefernce.setfileKeycam('');
//                         SharedPrefernce.setfileKeyfiles('');
//                         SharedPrefernce.sets3Urlcam('');
//                         SharedPrefernce.sets3Urlfiles('');
//                         Get.toNamed(Routes.viewcase);
//                       },
//                       text: 'Submit',
//                       options: FFButtonOptions(
//                         height: 40,
//                         padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
//                         iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
//                         color: FlutterFlowTheme.of(context).primaryText,
//                         textStyle:
//                             FlutterFlowTheme.of(context).titleSmall.override(
//                                   fontFamily: 'Poppins',
//                                   color: Colors.white,
//                                   letterSpacing: 0,
//                                   fontWeight: FontWeight.normal,
//                                 ),
//                         elevation: 0,
//                         borderRadius: BorderRadius.circular(0),
//                       ),
//                     ),
//                   ],
//                 ),
//               ].divide(SizedBox(height: 24)),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'dart:io';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nyaya_tech/pages/login_page/kyc_upload/kyc_model.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


class AadharWidget extends StatefulWidget {
  const AadharWidget({super.key});

  @override
  State<AadharWidget> createState() => _AadharWidgetState();
}

class _AadharWidgetState extends State<AadharWidget> {
  late AadharModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AadharModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
    
  }

  Future<File?> pickImageFromGallery() async {
  final ImagePicker picker = ImagePicker();
  final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

  if (pickedFile != null) {
    return File(pickedFile.path);
  } else {
    return null; // User canceled the picker
  }
}

Future<File?> openCameraForSelfie() async {
  final ImagePicker picker = ImagePicker();
  final XFile? pickedFile = await picker.pickImage(source: ImageSource.camera);

  if (pickedFile != null) {
    return File(pickedFile.path);
  } else {
    return null; // User canceled the picker
  }
}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.arrow_back),
                  )),
                Text(
                  'Verify Your Identity To Proceed With Your Case',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'DM Sans',
                        color: Colors.black,
                        fontSize: 16,
                        letterSpacing: 0.0,
                      ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Upload Aadhaar',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'DM Sans',
                                    color: Colors.black,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            border: Border.all(
                              color: Color(0xFFDBDBDB),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FFButtonWidget(
                                  onPressed: () {
                                    pickImageFromGallery();
                                  },
                                  text: 'Choose File',
                                  options: FFButtonOptions(
                                    height: 40,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 0, 16, 0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 0),
                                    color: Color(0xFFF3F3F3),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'DM Sans',
                                          color: Colors.black,
                                          fontSize: 14,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    elevation: 0,
                                    borderSide: BorderSide(
                                      color: Color(0xFFBDBDBD),
                                    ),
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                ),
                                Text(
                                  'No File Chosen',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'DM Sans',
                                        color: Colors.black,
                                        fontSize: 12,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ].divide(SizedBox(width: 12)),
                            ),
                          ),
                        ),
                      ].divide(SizedBox(height: 12)),
                    ),
                    FFButtonWidget(
                      onPressed: () {
                        openCameraForSelfie();
                      },
                      text: 'Take Picture',
                      icon: Icon(
                        Icons.photo_camera_outlined,
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        size: 18,
                      ),
                      options: FFButtonOptions(
                        height: 40,
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                        iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        color: Color(0xFF828282),
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'DM Sans',
                                  color: Colors.white,
                                  fontSize: 14,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                        elevation: 0,
                        borderSide: BorderSide(
                          color: Color(0xFFBDBDBD),
                        ),
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                  ].divide(SizedBox(height: 16)),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Upload Selfie',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'DM Sans',
                                  color: Colors.black,
                                  letterSpacing: 0.0,
                                ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              border: Border.all(
                                color: Color(0xFFDBDBDB),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(12),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  FFButtonWidget(
                                    onPressed: () {
                                     pickImageFromGallery();
                                    },
                                    text: 'Choose File',
                                    options: FFButtonOptions(
                                      height: 40,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 0, 16, 0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 0, 0),
                                      color: Color(0xFFF3F3F3),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'DM Sans',
                                            color: Colors.black,
                                            fontSize: 14,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                      elevation: 0,
                                      borderSide: BorderSide(
                                        color: Color(0xFFBDBDBD),
                                      ),
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                  ),
                                  Text(
                                    'No File Chosen',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'DM Sans',
                                          color: Colors.black,
                                          fontSize: 12,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ].divide(SizedBox(width: 12)),
                              ),
                            ),
                          ),
                        ].divide(SizedBox(height: 12)),
                      ),
                      FFButtonWidget(
                        onPressed: () {
                          openCameraForSelfie();
                        },
                        text: 'Take Picture',
                        icon: Icon(
                          Icons.photo_camera_outlined,
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          size: 18,
                        ),
                        options: FFButtonOptions(
                          height: 40,
                          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                          iconPadding:
                              EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          color: Color(0xFF828282),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'DM Sans',
                                    color: Colors.white,
                                    fontSize: 14,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                          elevation: 0,
                          borderSide: BorderSide(
                            color: Color(0xFFBDBDBD),
                          ),
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                    ].divide(SizedBox(height: 16)),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10,right: 5),
                      child: FFButtonWidget(
                        onPressed: () {
                          Get.back();
                        },
                        text: 'Submit',
                        options: FFButtonOptions(
                          height: 40,
                          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          color: FlutterFlowTheme.of(context).primaryText,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                          elevation: 0,
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                    ),
                  ],
                ),
              ].divide(SizedBox(height: 24)),
            ),
          ),
        ),
      ),
    );
  }
}


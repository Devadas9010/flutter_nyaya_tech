import '/flutter_flow/flutter_flow_util.dart';
import 'mobile_login_otp_widget.dart' show MobileLoginOtpWidget;
import 'package:flutter/material.dart';

class MobileLoginOtpModel extends FlutterFlowModel<MobileLoginOtpWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;

  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
  }

  @override
  void dispose() {
    pinCodeController?.dispose();
  }
}

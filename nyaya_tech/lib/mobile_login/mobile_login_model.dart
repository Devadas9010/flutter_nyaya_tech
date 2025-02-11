import '/flutter_flow/flutter_flow_util.dart';
import 'mobile_login_widget.dart' show MobileLoginWidget;
import 'package:flutter/material.dart';

class MobileLoginModel extends FlutterFlowModel<MobileLoginWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}

import '/flutter_flow/flutter_flow_util.dart';
import 'login_updated_page_widget.dart' show LoginUpdatedPageWidget;
import 'package:flutter/material.dart';

class LoginUpdatedPageModel extends FlutterFlowModel<LoginUpdatedPageWidget> {
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

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nyaya_tech/data_components/form_error_helper.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_theme.dart';

class CommentTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool isEnable;
  final Function(String)? onChanged;
  final TextInputType? textInputType;
  int? maxLine = 1;
  int? minLine = 1;
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool obscureText;
  final bool isPasswordField;
  final String? errorKey;
  final List<TextInputFormatter>? inputFormatters;
  final dynamic errors;

  CommentTextField({
    super.key,
    this.hintText,
    this.isEnable = true,
    this.onChanged,
    this.errorKey,
    this.prefixIcon,
    this.obscureText = false,
    this.suffixIcon,
    this.isPasswordField = false,
    this.errors,
    this.textInputType,
    required this.controller,
    this.maxLine,
    this.minLine,
    this.inputFormatters,
  });

  String? message() {
    if (errorKey == null) {
      return null;
    }
    return FormErrorHelper(errors: errors).message(errorKey!);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      autofocus: false,
      obscureText: obscureText,
      textCapitalization: TextCapitalization.sentences,
      minLines: minLine,
      maxLines: maxLine,
      keyboardType: textInputType,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
          labelStyle: FlutterFlowTheme.of(context)
              .labelMedium
              .override(fontFamily: 'DM Sans', letterSpacing: 0),
          hintText: hintText,
          hintStyle: FlutterFlowTheme.of(context)
              .labelMedium
              .override(fontFamily: 'DM Sans', letterSpacing: 0),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0XFFF7F9FB)),
              borderRadius: BorderRadius.zero),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0XFFF7F9FB)),
              borderRadius: BorderRadius.zero),
          filled: true,
          fillColor: Color(0XFFF7F9FB),
          suffixIcon: suffixIcon,
          errorText: message(),
          errorStyle: const TextStyle(color: Colors.red),
          contentPadding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
          prefixIcon: prefixIcon),
      style: FlutterFlowTheme.of(context)
          .bodyMedium
          .override(fontFamily: 'DM Sans'),
    );
  }
}

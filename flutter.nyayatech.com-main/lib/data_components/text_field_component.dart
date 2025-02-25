import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nyaya_tech/data_components/form_error_helper.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_theme.dart';

class TextFieldComponent extends StatelessWidget {
  final TextEditingController controller;
  final bool isEnable;
  Function(String)? onChanged;
  final TextInputType? textInputType;
  int? maxLine = 1;
  int? minLine = 1;
  final int? maxLength;
  String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool obscureText;
  final bool isPasswordField;
  final String? label;
  final String? errorKey;
  final List<TextInputFormatter>? inputFormatters;
  final dynamic errors;
  final Color? color;

  TextFieldComponent(
      {super.key,
      this.hintText,
      this.isEnable = true,
      this.onChanged,
      this.color,
      this.label,
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
      this.maxLength});

  String? message() {
    if (errorKey == null) {
      return null;
    }
    return FormErrorHelper(errors: errors).message(errorKey!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...{
          Padding(
            padding: EdgeInsets.only(bottom: 5),
            child: Text(
              label!,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Color(0XFF0C0C0C)),
            ),
          )
        },
        TextField(
          controller: controller,
          onChanged: onChanged,
          autofocus: false,
          obscureText: obscureText,
          minLines: minLine,
          maxLines: maxLine,
          maxLength: maxLength,
          keyboardType: textInputType,
          inputFormatters: [
            if (inputFormatters != null) ...inputFormatters!,
            CapitalizeTextInputFormatter(),
          ],
          decoration: InputDecoration(
              labelStyle: FlutterFlowTheme.of(context)
                  .labelMedium
                  .override(fontFamily: 'Plus Jakarta Sans', letterSpacing: 0),
              hintText: hintText,
              hintStyle: FlutterFlowTheme.of(context)
                  .labelMedium
                  .override(fontFamily: 'Plus Jakarta Sans', letterSpacing: 0),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(0),
              ),
              filled: true,
              fillColor: Color(0XFFffffff),
              suffixIcon: suffixIcon,
              suffixIconColor: Colors.black,
              errorText: message(),
              errorStyle: const TextStyle(color: Colors.red),
              contentPadding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
              prefixIcon: prefixIcon),
          style: FlutterFlowTheme.of(context)
              .bodyMedium
              .override(fontFamily: 'Plus Jakarta Sans'),
        ),
      ],
    );
  }
}

class CapitalizeTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text;

    final formattedText = text.splitMapJoin(
      RegExp(r'(?<=\.|\n|^)\s*([^\s]*)'),
      onMatch: (match) {
        final word = match.group(1) ?? '';
        if (word.isEmpty) return '';
        return word[0].toUpperCase() + word.substring(1).toLowerCase();
      },
      onNonMatch: (nonMatch) => nonMatch,
    );

    return TextEditingValue(text: formattedText, selection: newValue.selection);
  }
}

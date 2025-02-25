import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nyaya_tech/data_components/form_error_helper.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_theme.dart';

class DescriptionTextField extends StatelessWidget {
  final TextEditingController controller;
  final dynamic errors;
  final String? errorKey;
  final String? hintText;
  final List<TextInputFormatter>? inputFormatters;
  final Color? color;
  final Color? fillcolor;
  final String lable;
  const DescriptionTextField(
      {super.key,
      required this.controller,
      this.errorKey,
      this.inputFormatters,
      this.hintText,
      this.errors,
      this.fillcolor,
      this.color,
      required this.lable});

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
        Text(lable),
        SizedBox(height: 6),
        TextFormField(
          textCapitalization: TextCapitalization.sentences,
          controller: controller,
          autofocus: false,
          obscureText: false,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
              isDense: true,
              labelStyle: FlutterFlowTheme.of(context)
                  .labelMedium
                  .override(fontFamily: 'Plus Jakarta Sans', letterSpacing: 0),
              hintText: hintText,
              hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                  fontFamily: 'DM Sans',
                  fontSize: 16,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.normal),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: color ?? Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: color ?? Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(0),
              ),
              filled: true,
              fillColor: fillcolor,
              errorText: message(),
              errorStyle: const TextStyle(color: Colors.red)),
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Plus Jakarta Sans',
                letterSpacing: 0.0,
              ),
          maxLines: 6,
          cursorColor: FlutterFlowTheme.of(context).primaryText,
        ),
      ],
    );
  }
}

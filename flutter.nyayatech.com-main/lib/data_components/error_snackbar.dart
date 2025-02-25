import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

void errorSnackBar(BuildContext context, String message) {
  return showTopSnackBar(
    Overlay.of(context),
    Container(
      height: 40,
      child: CustomSnackBar.success(
        borderRadius: BorderRadius.all(Radius.circular(0)),
        message: message,
        backgroundColor: Colors.black,
        textStyle: TextStyle(
            fontWeight: FontWeight.w400, fontSize: 14, color: Colors.white),
      ),
    ),
  );
}

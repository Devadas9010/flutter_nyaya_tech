import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String text;
  final Function() ontap;
  final Color? color;

  const MenuItem(
      {super.key, required this.text, required this.ontap, this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        decoration: const BoxDecoration(color: Colors.black),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w400,
                    color: color,
                    fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

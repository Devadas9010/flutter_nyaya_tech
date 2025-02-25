import 'package:flutter/material.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_theme.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';

class HelpLineWidget extends StatelessWidget {
  final String text;
  const HelpLineWidget({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Need Help? We\'re Here!',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'DM Sans',
                  letterSpacing: 0,
                  fontWeight: FontWeight.w300),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child:
                  Image.asset('assets/images/customer.png', fit: BoxFit.cover),
            ),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              'Call our toll-free number for quick support',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'DM Sans',
                  fontSize: 12,
                  letterSpacing: 0,
                  fontWeight: FontWeight.w300),
            ),
            Text(
              text,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'DM Sans',
                  fontSize: 24,
                  letterSpacing: 0,
                  fontWeight: FontWeight.w300),
            ),
          ].divide(SizedBox(height: 12)),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'We\'re just a call away!',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'DM Sans',
                  letterSpacing: 0,
                  fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ].divide(SizedBox(height: 16)).around(SizedBox(height: 16)),
    );
  }
}

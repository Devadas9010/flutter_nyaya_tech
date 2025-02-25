import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_theme.dart';

class SnapshotErrorHandler<T> extends StatelessWidget {
  const SnapshotErrorHandler(
      {super.key,
      required this.snapshot,
      this.height = 190,
      this.fontSize = 23});
  final AsyncSnapshot<T> snapshot;
  final double height;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: snapshot.error.toString().contains('Failed host lookup')
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/NoInternet1.svg',
                    height: height,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Text(
                      "Network error",
                      style: FlutterFlowTheme.of(context).titleMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleMediumFamily,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).titleMediumFamily),
                            color: Color(0xFF090909),
                            fontSize: 23,
                            fontWeight: FontWeight.w500,
                            lineHeight: 1,
                          ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  )
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/images/No_internet1.svg',
                      width: 150, height: 150),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Text(
                      "No Data",
                      style: FlutterFlowTheme.of(context).titleMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleMediumFamily,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).titleMediumFamily),
                            color: Color(0xFF090909),
                            fontSize: 23,
                            fontWeight: FontWeight.w500,
                            lineHeight: 1,
                          ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                ],
              ));
  }
}

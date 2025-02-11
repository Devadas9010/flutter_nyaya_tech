import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nyaya_tech/components/details_screen_model.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_theme.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';

class DetailsScreenWidget extends StatefulWidget {
  final String text;
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  final String text5;
  final String text6;
  final String? imageUrl;
  final String imageUrl1;

  const DetailsScreenWidget(
      {super.key,
      required this.text,
      required this.text1,
      required this.text2,
      required this.text3,
      required this.text4,
      required this.text5,
      required this.text6,
      required this.imageUrl,
      required this.imageUrl1});

  @override
  State<DetailsScreenWidget> createState() => _DetailsScreenWidgetState();
}

class _DetailsScreenWidgetState extends State<DetailsScreenWidget> {
  late DetailsScreenModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetailsScreenModel());
  }

  int selectedIndex = 0;

  @override
  void dispose() {
    _model.maybeDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        border: Border.all(color: const Color(0xFFDBDBDB), width: 1),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = 0;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: selectedIndex == 0
                            ? const Color(0x27000000)
                            : FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            12, 11, 12, 11),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: SvgPicture.asset(
                                'assets/images/law.svg',
                                width: 24,
                                height: 24,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Lawyer Details',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'DM Sans',
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = 1;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: selectedIndex == 1
                            ? const Color(0x27000000)
                            : FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            12, 11, 12, 11),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: SvgPicture.asset(
                                'assets/images/ClientDetails.svg',
                                width: 24,
                                height: 24,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Client Details',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'DM Sans',
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: selectedIndex == 0
                          ? Image.network('${widget.imageUrl}',
                              fit: BoxFit.cover)
                          : Image.network(
                              widget.imageUrl1,
                              fit: BoxFit.cover,
                            ),
                    ),
                    selectedIndex == 0
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.text,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                        fontFamily: 'DM Sans',
                                        color: const Color(0xFF181616),
                                        fontWeight: FontWeight.w300,
                                        fontSize: 16,
                                        letterSpacing: 0),
                              ),
                              Text(
                                widget.text1,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                        fontFamily: 'DM Sans',
                                        color: const Color(0xFF444444),
                                        fontWeight: FontWeight.w300,
                                        fontSize: 14,
                                        letterSpacing: 0),
                              ),
                            ].divide(const SizedBox(height: 6)),
                          )
                        : Row(
                            children: [
                              Text(
                                widget.text3,
                                style: const TextStyle(
                                    fontFamily: 'DM Sans',
                                    fontWeight: FontWeight.w300,
                                    color: Color(0xFF181616),
                                    fontSize: 16),
                              )
                            ],
                          ),
                  ].divide(const SizedBox(width: 10)),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FaIcon(FontAwesomeIcons.mobileAlt,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24),
                    const SizedBox(width: 8),
                    Text(
                      selectedIndex == 0 ? widget.text2 : widget.text5,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'DM Sans',
                          letterSpacing: 0,
                          fontSize: 14,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(Icons.mail_rounded,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24),
                    const SizedBox(width: 8),
                    Text(
                      selectedIndex == 0 ? widget.text4 : widget.text6,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'DM Sans',
                          letterSpacing: 0,
                          fontWeight: FontWeight.w300,
                          fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

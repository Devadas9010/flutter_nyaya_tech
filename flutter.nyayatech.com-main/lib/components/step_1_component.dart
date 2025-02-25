import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_animation.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_theme.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';

class Step1Componentp extends StatefulWidget {
  final String text;
  final bool isSelected;
  final String image;
  const Step1Componentp(
      {super.key,
      required this.text,
      required this.isSelected,
      required this.image});

  @override
  State<Step1Componentp> createState() => _Step1ComponentpState();
}

class _Step1ComponentpState extends State<Step1Componentp> {
  final animationsMap = <String, AnimationInfo>{};
  @override
  void initState() {
    super.initState();
    animationsMap.addAll({
      'columnOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 700.0.ms,
            begin: Offset(0.0, 20.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 700.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 700.0.ms,
            begin: Offset(-20.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 700.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
     });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.white),
        child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8, 4, 0, 4),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(4),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(0),
                          child: SvgPicture.network(widget.image,
                              height: 44, width: 44),
                        ).animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation1']!),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              widget.text,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                      fontFamily: 'DM Sans',
                                      color: Color(0xFF181616),
                                      fontSize: 16,
                                      letterSpacing: 0),
                            ),
                          ),
                          FaIcon(
                            FontAwesomeIcons.arrowRight,
                            color: Colors.black,
                            size: 20,
                          ),
                        ].divide(SizedBox(width: 8)),
                      ),
                    ].divide(SizedBox(height: 4)),
                  ),
                ),
                Divider(
                    thickness: 2, color: Color(0XFF000000).withOpacity(0.1)),
              ].divide(SizedBox(height: 4)),
            ).animateOnPageLoad(animationsMap['columnOnPageLoadAnimation1']!)

            //  Row(
            //   children: [
            //     Container(
            //       color: Color(0XFF000000).withOpacity(0.1),
            //       child: Padding(
            //         padding: const EdgeInsets.all(6),
            //         child: SvgPicture.network(image,
            //             height: 40,
            //             width: 40,
            //             color: isSelected ? Colors.white : Colors.black),
            //       ),
            //     ),
            //     SizedBox(width: 12),
            //     Expanded(
            //       child: Text(
            //         text.toUpperCase(),
            //         style: FlutterFlowTheme.of(context).bodyMedium.override(
            //             fontFamily: 'DM Sans',
            //             fontWeight: FontWeight.w400,
            //             color: isSelected ? Colors.white : Color(0xFF181616),
            //             fontSize: 16),
            //       ),
            //     ),
            //   ],
            // ),
            ),
      ),
    );
  }
}

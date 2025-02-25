import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nyaya_tech/data_components/get_routing.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_animation.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_theme.dart';

class EmptyCaseWidget extends StatefulWidget {
  final String text;
  EmptyCaseWidget({super.key, required this.text});

  @override
  State<EmptyCaseWidget> createState() => _EmptyCaseWidgetState();
}

class _EmptyCaseWidgetState extends State<EmptyCaseWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();

    animationsMap.addAll({
      'imageOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 700.0.ms,
            begin: Offset(0.0, -50.0),
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
      'richTextOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 700.0.ms,
            begin: Offset(0.0, 50.0),
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
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: SvgPicture.asset(
                                'assets/images/No_cases.svg',
                                width: 200,
                                height: 200,
                                fit: BoxFit.contain),
                          ).animateOnPageLoad(
                              animationsMap['imageOnPageLoadAnimation']!),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            'It looks like you don’t have any active cases at the moment.',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'DM Sans',
                                  fontSize: 16,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w200,
                                ),
                          ),
                        ),
                      ],
                    ).animateOnPageLoad(
                        animationsMap['richTextOnPageLoadAnimation']!),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Get.toNamed(Routes.step1);
                            },
                            child: RichText(
                              textScaler: MediaQuery.of(context).textScaler,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                        'Start managing your legal work efficiently by creating a  ',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                            fontFamily: 'DM Sans',
                                            fontSize: 16,
                                            letterSpacing: 0,
                                            fontWeight: FontWeight.w200),
                                  ),
                                  TextSpan(
                                    text: widget.text,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                            fontFamily: 'DM Sans',
                                            color: Colors.black,
                                            letterSpacing: 0,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16),
                                  )
                                ],
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                        fontFamily: 'DM Sans',
                                        fontSize: 16,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.w400),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ).animateOnPageLoad(
                              animationsMap['richTextOnPageLoadAnimation']!),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

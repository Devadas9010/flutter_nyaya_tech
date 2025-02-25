import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_animation.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_theme.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';

class Step2Component extends StatefulWidget {
  final bool isSelected;
  final String text1;
  final String image;
  const Step2Component(
      {super.key,
      required this.isSelected,
      required this.text1,
      required this.image});

  @override
  State<Step2Component> createState() => _Step2ComponentState();
}

class _Step2ComponentState extends State<Step2Component> {
  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
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
      'containerOnPageLoadAnimation2': AnimationInfo(
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
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: widget.isSelected
              ? Colors.black
              : FlutterFlowTheme.of(context).secondaryBackground),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(8, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              color: Color(0XFF000000).withOpacity(0.1),
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: SvgPicture.network(widget.image,
                    height: 45,
                    width: 45,
                    color: widget.isSelected ? Colors.white : Colors.black),
              ),
            ).animateOnPageLoad(
                animationsMap['containerOnPageLoadAnimation2']!),
            Expanded(
              child: Text(
                widget.text1.toString().toUpperCase(),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'DM Sans',
                    color: widget.isSelected ? Colors.white : Color(0xFF181616),
                    fontSize: 16,
                    letterSpacing: 0,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ].divide(SizedBox(width: 8)),
        ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation1']!),
      ),
    );
  }
}

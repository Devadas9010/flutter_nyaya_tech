import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_theme.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
import 'package:nyaya_tech/pages/login_page/stages_screen/stage_screen_model.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  late StatusProductsModel _model;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StatusProductsModel());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF6F6F6),
        border: Border.all(color: Color(0xFFDBDBDB)),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFF2994A),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(7.33),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(0),
                            child: SvgPicture.asset(
                              'assets/images/fi_4272432_(1).svg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'On-boarding',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'DM Sans',
                                  color: Color(0xFF444444),
                                  fontSize: 18,
                                  letterSpacing: 0.0,
                                ),
                          ),
                          Text(
                            'Date & Time',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'DM Sans',
                                  color: Color(0xFF444444),
                                  fontSize: 12,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w300,
                                ),
                          ),
                        ].divide(SizedBox(height: 4)),
                      ),
                    ].divide(SizedBox(width: 10)),
                  ),
                  FaIcon(
                    FontAwesomeIcons.angleDown,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24,
                  ),
                ].divide(SizedBox(width: 10)),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _model.stagesdata![4].stage == 'On-boarding' ||
                              _model.stagesdata![4].isCompleted == true
                          ? Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                border: Border.all(
                                  color: Color(0xFF27AE60),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(5.33),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(0),
                                  child: SvgPicture.asset(
                                    'assets/images/check_1.svg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(0),
                              child: SvgPicture.asset(
                                'assets/images/Component_24.svg',
                                fit: BoxFit.cover,
                              ),
                            ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _model.stagesdata![4].subStage.toString(),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'DM Sans',
                                    color: Color(0xFF444444),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                            ),
                            Text(
                              DateFormat('dd MM YYYY HH:MM a')
                                  .format(_model.stagesdata![4].completedAt),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'DM Sans',
                                    color: Color(0xFF444444),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                            ),
                          ].divide(SizedBox(height: 4)),
                        ),
                      ),
                    ].divide(SizedBox(width: 8.7)),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(0),
                  child: Image.asset(
                    'assets/images/Frame_1321314409.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _model.stagesdata![5].stage == 'On-boarding' &&
                              _model.stagesdata![5].isCompleted == true
                          ? Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                border: Border.all(
                                  color: Color(0xFF27AE60),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(5.33),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(0),
                                  child: SvgPicture.asset(
                                    'assets/images/check_1.svg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(0),
                              child: SvgPicture.asset(
                                'assets/images/Component_24.svg',
                                fit: BoxFit.cover,
                              ),
                            ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _model.stagesdata![5].subStage.toString(),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'DM Sans',
                                    color: Color(0xFF444444),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                            ),
                            Text(
                              DateFormat('dd MM YYYY HH:MM a')
                                  .format(_model.stagesdata![5].completedAt),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'DM Sans',
                                    color: Color(0xFF444444),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                            ),
                          ].divide(SizedBox(height: 4)),
                        ),
                      ),
                    ].divide(SizedBox(width: 8.7)),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(0),
                  child: Image.asset(
                    'assets/images/Frame_1321314409.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(6, 4, 6, 4),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        _model.stagesdata![6].stage == 'On-boarding' &&
                                _model.stagesdata![6].isCompleted == true
                            ? Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  border: Border.all(
                                    color: Color(0xFF27AE60),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(5.33),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(0),
                                    child: SvgPicture.asset(
                                      'assets/images/check_1.svg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(0),
                                child: SvgPicture.asset(
                                  'assets/images/Component_24.svg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _model.stagesdata![6].stage.toString(),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'DM Sans',
                                      color: Color(0xFF444444),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                              ),
                              Text(
                                DateFormat('dd MM YYYY HH:MM a')
                                    .format(_model.stagesdata![6].completedAt),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'DM Sans',
                                      color: Color(0xFF444444),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                              ),
                            ].divide(SizedBox(height: 4)),
                          ),
                        ),
                      ].divide(SizedBox(width: 8.7)),
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(0),
                  child: Image.asset(
                    'assets/images/Frame_1321314424.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(6, 4, 6, 4),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        _model.stagesdata![7].stage == 'On-boarding' &&
                                _model.stagesdata![7].isCompleted == true
                            ? Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  border: Border.all(
                                    color: Color(0xFF27AE60),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(5.33),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(0),
                                    child: SvgPicture.asset(
                                      'assets/images/check_1.svg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(0),
                                child: SvgPicture.asset(
                                  'assets/images/fi_833602.svg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _model.stagesdata![7].subStage.toString(),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'DM Sans',
                                      color: Color(0xFF444444),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                              ),
                              Text(
                                DateFormat('dd MM YYYY HH:MM a')
                                    .format(_model.stagesdata![7].completedAt),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'DM Sans',
                                      color: Color(0xFF444444),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                              ),
                            ].divide(SizedBox(height: 4)),
                          ),
                        ),
                      ].divide(SizedBox(width: 8.7)),
                    ),
                  ),
                ),
              ],
            ),
          ].divide(SizedBox(height: 12)),
        ),
      ),
    );
  }
}

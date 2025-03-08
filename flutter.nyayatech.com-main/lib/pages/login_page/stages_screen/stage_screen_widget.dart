import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:nyaya_tech/backend/api_manager.dart';
import 'package:nyaya_tech/data_components/get_routing.dart';
import 'package:nyaya_tech/pages/login_page/stages_screen/stage_screen_model.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StatusProductsWidget extends StatefulWidget {
  const StatusProductsWidget({super.key});

  @override
  State<StatusProductsWidget> createState() => _StatusProductsWidgetState();
}

class _StatusProductsWidgetState extends State<StatusProductsWidget> {
  late StatusProductsModel _model;
  late Future<void> _future;
  bool preBoardingisUp = false;
  bool onBoardingisUp = false;
  bool caseFilingisUp = false;
  bool courtProceedingsisUp = false;
  bool trailPhaseisUp = false;
  bool caseClosureisUp = false;
  bool _isInitialStateSet = false; 
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StatusProductsModel());
    _future = fetchData();
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  Future<void> fetchData() async {
    await _model.fetchCaseStage();
  }

  void setInitialOpenStage() {
    if (_model.stagesdata != null && _model.stagesdata!.isNotEmpty) {
      // Reset all to false initially
      preBoardingisUp = false;
      onBoardingisUp = false;
      caseFilingisUp = false;
      courtProceedingsisUp = false;
      trailPhaseisUp = false;
      caseClosureisUp = false;

      // Check Pre-boarding (0-3)
      for (int i = 0; i < 4; i++) {
        if (_model.stagesdata![i].stage == 'Pre-boarding' &&
            _model.stagesdata![i].isCompleted == false &&
            (i == 0 || _model.stagesdata![i - 1].isCompleted == true)) {
          preBoardingisUp = true;
          return;
        }
      }

      // Check On-boarding (4-7)
      for (int i = 4; i < 8; i++) {
        if (_model.stagesdata![i].stage == 'On-boarding' &&
            _model.stagesdata![i].isCompleted == false &&
            (i == 4 || _model.stagesdata![i - 1].isCompleted == true)) {
          onBoardingisUp = true;
          return;
        }
      }

      // Check Case Filing (8-12)
      for (int i = 8; i < 13; i++) {
        if (_model.stagesdata![i].stage == 'Case Filing' &&
            _model.stagesdata![i].isCompleted == false &&
            (i == 8 || _model.stagesdata![i - 1].isCompleted == true)) {
          caseFilingisUp = true;
          return;
        }
      }

      // Check Court Proceedings (13-17)
      for (int i = 13; i < 18; i++) {
        if (_model.stagesdata![i].stage == 'Court proceedings' &&
            _model.stagesdata![i].isCompleted == false &&
            (i == 13 || _model.stagesdata![i - 1].isCompleted == true)) {
          courtProceedingsisUp = true;
          return;
        }
      }

      // Check Trail Phase (18-27)
      for (int i = 18; i < 28; i++) {
        if (_model.stagesdata![i].stage == 'Trail phase' &&
            _model.stagesdata![i].isCompleted == false &&
            (i == 18 || _model.stagesdata![i - 1].isCompleted == true)) {
          trailPhaseisUp = true;
          return;
        }
      }

      // Check Case Closure (28-31)
      for (int i = 28; i < 32; i++) {
        if (_model.stagesdata![i].stage == 'Case Closure' &&
            _model.stagesdata![i].isCompleted == false &&
            (i == 28 || _model.stagesdata![i - 1].isCompleted == true)) {
          caseClosureisUp = true;
          return;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).secondaryBackground,
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: InkWell(
                            onTap: () {
                              Get.offNamed(Routes.viewcase);
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: FutureBuilder(
                      future: _future,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 200),
                            child: Center(
                              child: Lottie.asset(
                                'assets/lottie_animations/loading_animation.json',
                                width: 150,
                                height: 150,
                              ),
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/images/No_internet1.svg',
                                  height: 100,
                                  width: 100,
                                ),
                                Text(
                                  'No-Connection',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else {
                          // Set initial state only once after data is loaded
                          if (!_isInitialStateSet) {
                            setInitialOpenStage();
                            _isInitialStateSet = true;
                          }
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // 1) Pre Boarding
                              Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFF6F6F6),
                                  border: Border.all(color: Color(0xFFDBDBDB)),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 2),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              preBoardingisUp = !preBoardingisUp;
                                              if (preBoardingisUp) {
                                                onBoardingisUp = false;
                                                caseFilingisUp = false;
                                                courtProceedingsisUp = false;
                                                trailPhaseisUp = false;
                                                caseClosureisUp = false;
                                              }
                                            });
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Builder(
                                                    builder: (context) {
                                                      final preBoardingStages = _model.stagesdata!
                                                      
                                                          .where((stage) => stage.stage == 'Pre-boarding')
                                                          .toList();
                                                      final anyCompleted =
                                                          preBoardingStages.any((stage) => stage.isCompleted == true);
                                                      final allCompleted =
                                                          preBoardingStages.every((stage) => stage.isCompleted == true);
                                                      if (allCompleted) {
                                                        return Padding(
                                                          padding: const EdgeInsets.all(5.33),
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                              color: Color(0xFF4CAF50),
                                                            ),
                                                            child: Padding(
                                                              padding: EdgeInsets.all(7.33),
                                                              child: ClipRRect(
                                                                borderRadius: BorderRadius.circular(0),
                                                                child: SvgPicture.asset(
                                                                  color: Colors.white,
                                                                  'assets/images/check_1.svg',
                                                                  fit: BoxFit.cover,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      } else if (anyCompleted) {
                                                        return Padding(
                                                          padding: const EdgeInsets.all(4.0),
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                              color: Color(0xFFF2994A),
                                                            ),
                                                            child: Padding(
                                                              padding: EdgeInsets.all(4),
                                                              child: ClipRRect(
                                                                borderRadius: BorderRadius.circular(0),
                                                                child: SvgPicture.asset(
                                                                  'assets/images/pre_boarding.svg',
                                                                  fit: BoxFit.cover,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      } else {
                                                        return Padding(
                                                          padding: const EdgeInsets.all(4.0),
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                              color: Color(0xFFFFFFFF),
                                                            ),
                                                            child: Padding(
                                                              padding: EdgeInsets.all(4),
                                                              child: ClipRRect(
                                                                borderRadius: BorderRadius.circular(0),
                                                                child: SvgPicture.asset(
                                                                  'assets/images/pre_boarding.svg',
                                                                  fit: BoxFit.cover,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                    },
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.all(12.0),
                                                    child: Text(
                                                      'Pre-boarding',
                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                            fontFamily: 'DM Sans',
                                                            fontWeight: FontWeight.w500,
                                                            color: Color(0xFF444444),
                                                            fontSize: 18,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(width: 10)),
                                              ),
                                              FaIcon(
                                                preBoardingisUp ? FontAwesomeIcons.angleDown : FontAwesomeIcons.angleUp,
                                                color: FlutterFlowTheme.of(context).primaryText,
                                                size: 24,
                                              ),
                                            ].divide(SizedBox(width: 10)),
                                          ),
                                        ),
                                      ),
                                      if (preBoardingisUp)
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            for (int i = 0; i < 4; i++)
                                              Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 4),
                                                    child: Row(
                                                      mainAxisSize: MainAxisSize.max,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        if (_model.stagesdata![i].stage == 'Pre-boarding' &&
                                                            _model.stagesdata![i].isCompleted == true)
                                                          Row(
                                                            children: [
                                                              Container(
                                                                decoration: BoxDecoration(
                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                  border: Border.all(color: Color(0xFF27AE60)),
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
                                                              ),
                                                              SizedBox(width: 8.7),
                                                              Column(
                                                                mainAxisSize: MainAxisSize.max,
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Text(
                                                                    _model.stagesdata![i].subStage ?? '',
                                                                    style: FlutterFlowTheme.of(context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily: 'DM Sans',
                                                                          fontSize: 14,
                                                                          color: Color(0xFF444444),
                                                                          letterSpacing: 0.0,
                                                                          fontWeight: FontWeight.w300,
                                                                        ),
                                                                  ),
                                                                  SizedBox(height: 4),
                                                                  Text(
                                                                    _model.stagesdata![i].completedAt == null
                                                                        ? '--'
                                                                        : DateFormat("dd-MM-yyyy hh:mm a").format(
                                                                            DateTime.parse(
                                                                                _model.stagesdata![i].completedAt!)),
                                                                    style: FlutterFlowTheme.of(context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily: 'DM Sans',
                                                                          color: Color(0xFF444444),
                                                                          letterSpacing: 0.0,
                                                                          fontWeight: FontWeight.w300,
                                                                          fontSize: 12,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          )
                                                        else if (_model.stagesdata![i].stage == 'Pre-boarding' &&
                                                            _model.stagesdata![i].isCompleted == false &&
                                                            (i == 0 || _model.stagesdata![i - 1].isCompleted == true))
                                                          Expanded(
                                                            child: Container(
                                                              decoration: BoxDecoration(
                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                border: Border.all(color: Color(0x66000000)),
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional.fromSTEB(6, 1, 6, 1),
                                                                child: Row(
                                                                  mainAxisSize: MainAxisSize.max,
                                                                  children: [
                                                                    ClipRRect(
                                                                      borderRadius: BorderRadius.circular(0),
                                                                      child: SvgPicture.asset(
                                                                        'assets/images/Component_24.svg',
                                                                        fit: BoxFit.cover,
                                                                      ),
                                                                    ),
                                                                    SizedBox(width: 8.7),
                                                                    Column(
                                                                      mainAxisSize: MainAxisSize.max,
                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                      children: [
                                                                        Text(
                                                                          _model.stagesdata![i].subStage ?? '',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'DM Sans',
                                                                                fontSize: 14,
                                                                                color: Color(0xFF444444),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w300,
                                                                              ),
                                                                        ),
                                                                        SizedBox(height: 4),
                                                                        Text(
                                                                          _model.stagesdata![i].completedAt == null
                                                                              ? '--'
                                                                              : DateFormat("dd-MM-yyyy hh:mm a").format(
                                                                                  DateTime.parse(_model
                                                                                      .stagesdata![i].completedAt!)),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'DM Sans',
                                                                                color: Color(0xFF444444),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w300,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          )
                                                        else if (_model.stagesdata![i].stage == 'Pre-boarding' &&
                                                            _model.stagesdata![i].isCompleted == false)
                                                          Row(
                                                            children: [
                                                              ClipRRect(
                                                                borderRadius: BorderRadius.circular(0),
                                                                child: SvgPicture.asset(
                                                                  'assets/images/fi_833602.svg',
                                                                  fit: BoxFit.cover,
                                                                ),
                                                              ),
                                                              SizedBox(width: 8.7),
                                                              Column(
                                                                mainAxisSize: MainAxisSize.max,
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Text(
                                                                    _model.stagesdata![i].subStage ?? '',
                                                                    style: FlutterFlowTheme.of(context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily: 'DM Sans',
                                                                          color: Color(0xFF444444),
                                                                          letterSpacing: 0.0,
                                                                          fontWeight: FontWeight.w300,
                                                                          fontSize: 14,
                                                                        ),
                                                                  ),
                                                                  SizedBox(height: 4),
                                                                  Text(
                                                                    _model.stagesdata![i].completedAt == null
                                                                        ? '--'
                                                                        : DateFormat("dd-MM-yyyy hh:mm a").format(
                                                                            DateTime.parse(
                                                                                _model.stagesdata![i].completedAt!)),
                                                                    style: FlutterFlowTheme.of(context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily: 'DM Sans',
                                                                          color: Color(0xFF444444),
                                                                          letterSpacing: 0.0,
                                                                          fontWeight: FontWeight.w300,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                                  if (i < 3 && _model.stagesdata![i].stage == 'Pre-boarding')
                                                    Padding(
                                                      padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                                      child: ClipRRect(
                                                        borderRadius: BorderRadius.circular(0),
                                                        child: Image.asset(
                                                          _model.stagesdata![i].isCompleted == true
                                                              ? 'assets/images/green_line.png'
                                                              : 'assets/images/orange_line.png',
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                          ].divide(SizedBox(height: 0)),
                                        ),
                                    ].divide(SizedBox(height: 5)),
                                  ),
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(0),
                                child: SvgPicture.asset(
                                  'assets/images/3_dots.svg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              // 2) On Boarding
                              Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFF6F6F6),
                                  border: Border.all(color: Color(0xFFDBDBDB)),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 2),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              onBoardingisUp = !onBoardingisUp;
                                              if (onBoardingisUp) {
                                                preBoardingisUp = false;
                                                caseFilingisUp = false;
                                                courtProceedingsisUp = false;
                                                trailPhaseisUp = false;
                                                caseClosureisUp = false;
                                              }
                                            });
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Builder(
                                                    builder: (context) {
                                                      final onBoardingStages = _model.stagesdata!
                                                          .where((stage) => stage.stage == 'On-boarding')
                                                          .toList();
                                                      final anyCompleted =
                                                          onBoardingStages.any((stage) => stage.isCompleted == true);
                                                      final allCompleted =
                                                          onBoardingStages.every((stage) => stage.isCompleted == true);
                                                      if (allCompleted) {
                                                        return Padding(
                                                          padding: const EdgeInsets.all(4.0),
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                              color: Color(0xFF4CAF50),
                                                            ),
                                                            child: Padding(
                                                              padding: EdgeInsets.all(7.33),
                                                              child: ClipRRect(
                                                                borderRadius: BorderRadius.circular(0),
                                                                child: SvgPicture.asset(
                                                                  color: Colors.white,
                                                                  'assets/images/check_1.svg',
                                                                  fit: BoxFit.cover,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      } else if (anyCompleted) {
                                                        return Padding(
                                                          padding: const EdgeInsets.all(4.0),
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                              color: Color(0xFFF2994A),
                                                            ),
                                                            child: Padding(
                                                              padding: EdgeInsets.all(4),
                                                              child: ClipRRect(
                                                                borderRadius: BorderRadius.circular(0),
                                                                child: SvgPicture.asset(
                                                                  'assets/images/on_boarding.svg',
                                                                  fit: BoxFit.cover,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      } else {
                                                        return Padding(
                                                          padding: const EdgeInsets.all(4.0),
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                              color: Color(0xFFFFFFFF),
                                                            ),
                                                            child: Padding(
                                                              padding: EdgeInsets.all(4),
                                                              child: ClipRRect(
                                                                borderRadius: BorderRadius.circular(0),
                                                                child: SvgPicture.asset(
                                                                  'assets/images/on_boarding.svg',
                                                                  fit: BoxFit.cover,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                    },
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.all(12.0),
                                                    child: Text(
                                                      'On-boarding',
                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                            fontFamily: 'DM Sans',
                                                            fontWeight: FontWeight.w500,
                                                            color: Color(0xFF444444),
                                                            fontSize: 18,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(width: 10)),
                                              ),
                                              FaIcon(
                                                onBoardingisUp ? FontAwesomeIcons.angleDown : FontAwesomeIcons.angleUp,
                                                color: FlutterFlowTheme.of(context).primaryText,
                                                size: 24,
                                              ),
                                            ].divide(SizedBox(width: 10)),
                                          ),
                                        ),
                                      ),
                                      if (onBoardingisUp)
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            for (int i = 4; i < 8; i++)
                                              Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 4),
                                                    child: Row(
                                                      mainAxisSize: MainAxisSize.max,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        if (_model.stagesdata![i].stage == 'On-boarding' &&
                                                            _model.stagesdata![i].isCompleted == true)
                                                          Row(
                                                            children: [
                                                              Container(
                                                                decoration: BoxDecoration(
                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                  border: Border.all(color: Color(0xFF27AE60)),
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
                                                              ),
                                                              SizedBox(width: 8.7),
                                                              Column(
                                                                mainAxisSize: MainAxisSize.max,
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Text(
                                                                    _model.stagesdata![i].subStage ?? '',
                                                                    style: FlutterFlowTheme.of(context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily: 'DM Sans',
                                                                          fontSize: 14,
                                                                          color: Color(0xFF444444),
                                                                          letterSpacing: 0.0,
                                                                          fontWeight: FontWeight.w300,
                                                                        ),
                                                                  ),
                                                                  SizedBox(height: 4),
                                                                  Text(
                                                                    _model.stagesdata![i].completedAt == null
                                                                        ? '--'
                                                                        : DateFormat("dd-MM-yyyy hh:mm a").format(
                                                                            DateTime.parse(
                                                                                _model.stagesdata![i].completedAt!)),
                                                                    style: FlutterFlowTheme.of(context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily: 'DM Sans',
                                                                          color: Color(0xFF444444),
                                                                          letterSpacing: 0.0,
                                                                          fontWeight: FontWeight.w300,
                                                                          fontSize: 12,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          )
                                                        else if (_model.stagesdata![i].stage == 'On-boarding' &&
                                                            _model.stagesdata![i].isCompleted == false &&
                                                            (i == 3 || _model.stagesdata![i - 1].isCompleted == true))
                                                          Expanded(
                                                            child: Container(
                                                              decoration: BoxDecoration(
                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                border: Border.all(color: Color(0x66000000)),
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional.fromSTEB(6, 1, 6, 1),
                                                                child: Row(
                                                                  mainAxisSize: MainAxisSize.max,
                                                                  children: [
                                                                    ClipRRect(
                                                                      borderRadius: BorderRadius.circular(0),
                                                                      child: SvgPicture.asset(
                                                                        'assets/images/Component_24.svg',
                                                                        fit: BoxFit.cover,
                                                                      ),
                                                                    ),
                                                                    SizedBox(width: 8.7),
                                                                    Column(
                                                                      mainAxisSize: MainAxisSize.max,
                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                      children: [
                                                                        Text(
                                                                          _model.stagesdata![i].subStage ?? '',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'DM Sans',
                                                                                fontSize: 14,
                                                                                color: Color(0xFF444444),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w300,
                                                                              ),
                                                                        ),
                                                                        SizedBox(height: 4),
                                                                        Text(
                                                                          _model.stagesdata![i].completedAt == null
                                                                              ? '--'
                                                                              : DateFormat("dd-MM-yyyy hh:mm a").format(
                                                                                  DateTime.parse(_model
                                                                                      .stagesdata![i].completedAt!)),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'DM Sans',
                                                                                color: Color(0xFF444444),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w300,
                                                                                fontSize: 12,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          )
                                                        else if (_model.stagesdata![i].stage == 'On-boarding' &&
                                                            _model.stagesdata![i].isCompleted == false)
                                                          Row(
                                                            children: [
                                                              ClipRRect(
                                                                borderRadius: BorderRadius.circular(0),
                                                                child: SvgPicture.asset(
                                                                  'assets/images/fi_833602.svg',
                                                                  fit: BoxFit.cover,
                                                                ),
                                                              ),
                                                              SizedBox(width: 8.7),
                                                              Column(
                                                                mainAxisSize: MainAxisSize.max,
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Text(
                                                                    _model.stagesdata![i].subStage ?? '',
                                                                    style: FlutterFlowTheme.of(context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily: 'DM Sans',
                                                                          color: Color(0xFF444444),
                                                                          letterSpacing: 0.0,
                                                                          fontWeight: FontWeight.w300,
                                                                          fontSize: 14,
                                                                        ),
                                                                  ),
                                                                  SizedBox(height: 4),
                                                                  Text(
                                                                    _model.stagesdata![i].completedAt == null
                                                                        ? '--'
                                                                        : DateFormat("dd-MM-yyyy hh:mm a").format(
                                                                            DateTime.parse(
                                                                                _model.stagesdata![i].completedAt!)),
                                                                    style: FlutterFlowTheme.of(context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily: 'DM Sans',
                                                                          color: Color(0xFF444444),
                                                                          letterSpacing: 0.0,
                                                                          fontWeight: FontWeight.w300,
                                                                          fontSize: 12,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                                  if (i < 7 && _model.stagesdata![i].stage == 'On-boarding')
                                                    Padding(
                                                      padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                                      child: ClipRRect(
                                                        borderRadius: BorderRadius.circular(0),
                                                        child: Image.asset(
                                                          _model.stagesdata![i].isCompleted == true
                                                              ? 'assets/images/green_line.png'
                                                              : 'assets/images/orange_line.png',
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                          ].divide(SizedBox(height: 0)),
                                        ),
                                    ].divide(SizedBox(height: 5)),
                                  ),
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(0),
                                child: SvgPicture.asset(
                                  'assets/images/3_dots.svg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              // 3) Case Filing
                              Container(
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
                                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              caseFilingisUp = !caseFilingisUp;
                                              if (caseFilingisUp) {
                                                preBoardingisUp = false;
                                                onBoardingisUp = false;
                                                courtProceedingsisUp = false;
                                                trailPhaseisUp = false;
                                                caseClosureisUp = false;
                                              }
                                            });
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Builder(
                                                    builder: (context) {
                                                      final caseFilingStages = _model.stagesdata!
                                                          .where((stage) => stage.stage == 'Case Filing')
                                                          .toList();
                                                      final anyCompleted =
                                                          caseFilingStages.any((stage) => stage.isCompleted == true);
                                                      final allCompleted =
                                                          caseFilingStages.every((stage) => stage.isCompleted == true);
                                                      if (allCompleted) {
                                                        return Padding(
                                                          padding: const EdgeInsets.all(5.33),
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                              color: Color(0xFF4CAF50),
                                                            ),
                                                            child: Padding(
                                                              padding: EdgeInsets.all(7.33),
                                                              child: ClipRRect(
                                                                borderRadius: BorderRadius.circular(0),
                                                                child: SvgPicture.asset(
                                                                  color: Colors.white,
                                                                  'assets/images/check_1.svg',
                                                                  fit: BoxFit.cover,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      } else if (anyCompleted) {
                                                        return Padding(
                                                          padding: const EdgeInsets.all(4.0),
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                              color: Color(0xFFF2994A),
                                                            ),
                                                            child: Padding(
                                                              padding: EdgeInsets.all(4),
                                                              child: ClipRRect(
                                                                borderRadius: BorderRadius.circular(0),
                                                                child: SvgPicture.asset(
                                                                  'assets/images/case_filing.svg',
                                                                  fit: BoxFit.cover,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      } else {
                                                        return Padding(
                                                          padding: const EdgeInsets.all(4.0),
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                              color: Color(0xFFFFFFFF),
                                                            ),
                                                            child: Padding(
                                                              padding: EdgeInsets.all(4),
                                                              child: ClipRRect(
                                                                borderRadius: BorderRadius.circular(0),
                                                                child: SvgPicture.asset(
                                                                  'assets/images/case_filing.svg',
                                                                  fit: BoxFit.cover,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                    },
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.all(12.0),
                                                    child: Text(
                                                      'Case Filing',
                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                            fontFamily: 'DM Sans',
                                                            fontWeight: FontWeight.w500,
                                                            color: Color(0xFF444444),
                                                            fontSize: 18,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(width: 10)),
                                              ),
                                              FaIcon(
                                                caseFilingisUp ? FontAwesomeIcons.angleDown : FontAwesomeIcons.angleUp,
                                                color: FlutterFlowTheme.of(context).primaryText,
                                                size: 24,
                                              ),
                                            ].divide(SizedBox(width: 10)),
                                          ),
                                        ),
                                      ),
                                      if (caseFilingisUp)
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            for (int i = 8; i < 13; i++)
                                              Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 4),
                                                    child: Row(
                                                      mainAxisSize: MainAxisSize.max,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        if (_model.stagesdata![i].stage == 'Case Filing' &&
                                                            _model.stagesdata![i].isCompleted == true)
                                                          Row(
                                                            children: [
                                                              Container(
                                                                decoration: BoxDecoration(
                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                  border: Border.all(color: Color(0xFF27AE60)),
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
                                                              ),
                                                              SizedBox(width: 8.7),
                                                              Column(
                                                                mainAxisSize: MainAxisSize.max,
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Text(
                                                                    _model.stagesdata![i].subStage ?? '',
                                                                    style: FlutterFlowTheme.of(context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily: 'DM Sans',
                                                                          fontSize: 14,
                                                                          color: Color(0xFF444444),
                                                                          letterSpacing: 0.0,
                                                                          fontWeight: FontWeight.w300,
                                                                        ),
                                                                  ),
                                                                  SizedBox(height: 4),
                                                                  Text(
                                                                    _model.stagesdata![i].completedAt == null
                                                                        ? '--'
                                                                        : DateFormat("dd-MM-yyyy hh:mm a").format(
                                                                            DateTime.parse(
                                                                                _model.stagesdata![i].completedAt!)),
                                                                    style: FlutterFlowTheme.of(context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily: 'DM Sans',
                                                                          color: Color(0xFF444444),
                                                                          letterSpacing: 0.0,
                                                                          fontWeight: FontWeight.w300,
                                                                          fontSize: 12,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          )
                                                        else if (_model.stagesdata![i].stage == 'Case Filing' &&
                                                            _model.stagesdata![i].isCompleted == false &&
                                                            (i == 7 || _model.stagesdata![i - 1].isCompleted == true))
                                                          Expanded(
                                                            child: Container(
                                                              decoration: BoxDecoration(
                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                border: Border.all(color: Color(0x66000000)),
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional.fromSTEB(6, 1, 6, 1),
                                                                child: Row(
                                                                  mainAxisSize: MainAxisSize.max,
                                                                  children: [
                                                                    ClipRRect(
                                                                      borderRadius: BorderRadius.circular(0),
                                                                      child: SvgPicture.asset(
                                                                        'assets/images/Component_24.svg',
                                                                        fit: BoxFit.cover,
                                                                      ),
                                                                    ),
                                                                    SizedBox(width: 8.7),
                                                                    Column(
                                                                      mainAxisSize: MainAxisSize.max,
                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                      children: [
                                                                        Text(
                                                                          _model.stagesdata![i].subStage ?? '',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'DM Sans',
                                                                                fontSize: 14,
                                                                                color: Color(0xFF444444),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w300,
                                                                              ),
                                                                        ),
                                                                        SizedBox(height: 4),
                                                                        Text(
                                                                          _model.stagesdata![i].completedAt == null
                                                                              ? '--'
                                                                              : DateFormat("dd-MM-yyyy hh:mm a").format(
                                                                                  DateTime.parse(_model
                                                                                      .stagesdata![i].completedAt!)),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'DM Sans',
                                                                                color: Color(0xFF444444),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w300,
                                                                                fontSize: 12,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          )
                                                        else if (_model.stagesdata![i].stage == 'Case Filing' &&
                                                            _model.stagesdata![i].isCompleted == false)
                                                          Row(
                                                            children: [
                                                              ClipRRect(
                                                                borderRadius: BorderRadius.circular(0),
                                                                child: SvgPicture.asset(
                                                                  'assets/images/fi_833602.svg',
                                                                  fit: BoxFit.cover,
                                                                ),
                                                              ),
                                                              SizedBox(width: 8.7),
                                                              Column(
                                                                mainAxisSize: MainAxisSize.max,
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Text(
                                                                    _model.stagesdata![i].subStage ?? '',
                                                                    style: FlutterFlowTheme.of(context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily: 'DM Sans',
                                                                          color: Color(0xFF444444),
                                                                          letterSpacing: 0.0,
                                                                          fontWeight: FontWeight.w300,
                                                                          fontSize: 14,
                                                                        ),
                                                                  ),
                                                                  SizedBox(height: 4),
                                                                  Text(
                                                                    _model.stagesdata![i].completedAt == null
                                                                        ? '--'
                                                                        : DateFormat("dd-MM-yyyy hh:mm a").format(
                                                                            DateTime.parse(
                                                                                _model.stagesdata![i].completedAt!)),
                                                                    style: FlutterFlowTheme.of(context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily: 'DM Sans',
                                                                          color: Color(0xFF444444),
                                                                          letterSpacing: 0.0,
                                                                          fontWeight: FontWeight.w300,
                                                                          fontSize: 12,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                                  if (i < 12 && _model.stagesdata![i].stage == 'Case Filing')
                                                    Padding(
                                                      padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                                      child: ClipRRect(
                                                        borderRadius: BorderRadius.circular(0),
                                                        child: Image.asset(
                                                          _model.stagesdata![i].isCompleted == true
                                                              ? 'assets/images/green_line.png'
                                                              : 'assets/images/orange_line.png',
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                          ].divide(SizedBox(height: 0)),
                                        ),
                                    ].divide(SizedBox(height: 5)),
                                  ),
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(0),
                                child: SvgPicture.asset(
                                  'assets/images/3_dots.svg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              // 4) Court Proceedings
                              Container(
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
                                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              courtProceedingsisUp = !courtProceedingsisUp;
                                              if (courtProceedingsisUp) {
                                                preBoardingisUp = false;
                                                onBoardingisUp = false;
                                                caseFilingisUp = false;
                                                trailPhaseisUp = false;
                                                caseClosureisUp = false;
                                              }
                                            });
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Builder(
                                                    builder: (context) {
                                                      final courtProceedingsStages = _model.stagesdata!
                                                          .where((stage) => stage.stage == 'Court proceedings')
                                                          .toList();
                                                      final anyCompleted = courtProceedingsStages
                                                          .any((stage) => stage.isCompleted == true);
                                                      final allCompleted = courtProceedingsStages
                                                          .every((stage) => stage.isCompleted == true);
                                                      if (allCompleted) {
                                                        return Padding(
                                                          padding: const EdgeInsets.all(5.33),
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                              color: Color(0xFF4CAF50),
                                                            ),
                                                            child: Padding(
                                                              padding: EdgeInsets.all(7.33),
                                                              child: ClipRRect(
                                                                borderRadius: BorderRadius.circular(0),
                                                                child: SvgPicture.asset(
                                                                  color: Colors.white,
                                                                  'assets/images/check_1.svg',
                                                                  fit: BoxFit.cover,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      } else if (anyCompleted) {
                                                        return Padding(
                                                          padding: const EdgeInsets.all(4.0),
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                              color: Color(0xFFF2994A),
                                                            ),
                                                            child: Padding(
                                                              padding: EdgeInsets.all(4),
                                                              child: ClipRRect(
                                                                borderRadius: BorderRadius.circular(0),
                                                                child: SvgPicture.asset(
                                                                  'assets/images/court_proceedings.svg',
                                                                  fit: BoxFit.cover,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      } else {
                                                        return Padding(
                                                          padding: const EdgeInsets.all(4.0),
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                              color: Color(0xFFFFFFFF),
                                                            ),
                                                            child: Padding(
                                                              padding: EdgeInsets.all(4),
                                                              child: ClipRRect(
                                                                borderRadius: BorderRadius.circular(0),
                                                                child: SvgPicture.asset(
                                                                  'assets/images/court_proceedings.svg',
                                                                  fit: BoxFit.cover,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                    },
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.all(12.0),
                                                    child: Text(
                                                      'Court Proceedings',
                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                            fontFamily: 'DM Sans',
                                                            fontWeight: FontWeight.w500,
                                                            color: Color(0xFF444444),
                                                            fontSize: 18,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(width: 10)),
                                              ),
                                              FaIcon(
                                                courtProceedingsisUp
                                                    ? FontAwesomeIcons.angleDown
                                                    : FontAwesomeIcons.angleUp,
                                                color: FlutterFlowTheme.of(context).primaryText,
                                                size: 24,
                                              ),
                                            ].divide(SizedBox(width: 10)),
                                          ),
                                        ),
                                      ),
                                      if (courtProceedingsisUp)
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            for (int i = 13; i < 18; i++)
                                              Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 4),
                                                    child: Row(
                                                      mainAxisSize: MainAxisSize.max,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        if (_model.stagesdata![i].stage == 'Court proceedings' &&
                                                            _model.stagesdata![i].isCompleted == true)
                                                          Row(
                                                            children: [
                                                              Container(
                                                                decoration: BoxDecoration(
                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                  border: Border.all(color: Color(0xFF27AE60)),
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
                                                              ),
                                                              SizedBox(width: 8.7),
                                                              Column(
                                                                mainAxisSize: MainAxisSize.max,
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Text(
                                                                    _model.stagesdata![i].subStage ?? '',
                                                                    style: FlutterFlowTheme.of(context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily: 'DM Sans',
                                                                          fontSize: 14,
                                                                          color: Color(0xFF444444),
                                                                          letterSpacing: 0.0,
                                                                          fontWeight: FontWeight.w300,
                                                                        ),
                                                                  ),
                                                                  SizedBox(height: 4),
                                                                  Text(
                                                                    _model.stagesdata![i].completedAt == null
                                                                        ? '--'
                                                                        : DateFormat("dd-MM-yyyy hh:mm a").format(
                                                                            DateTime.parse(
                                                                                _model.stagesdata![i].completedAt!)),
                                                                    style: FlutterFlowTheme.of(context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily: 'DM Sans',
                                                                          color: Color(0xFF444444),
                                                                          letterSpacing: 0.0,
                                                                          fontWeight: FontWeight.w300,
                                                                          fontSize: 12,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          )
                                                        else if (_model.stagesdata![i].stage == 'Court proceedings' &&
                                                            _model.stagesdata![i].isCompleted == false &&
                                                            (i == 12 || _model.stagesdata![i - 1].isCompleted == true))
                                                          Expanded(
                                                            child: Container(
                                                              decoration: BoxDecoration(
                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                border: Border.all(color: Color(0x66000000)),
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional.fromSTEB(6, 1, 6, 1),
                                                                child: Row(
                                                                  mainAxisSize: MainAxisSize.max,
                                                                  children: [
                                                                    ClipRRect(
                                                                      borderRadius: BorderRadius.circular(0),
                                                                      child: SvgPicture.asset(
                                                                        'assets/images/Component_24.svg',
                                                                        fit: BoxFit.cover,
                                                                      ),
                                                                    ),
                                                                    SizedBox(width: 8.7),
                                                                    Column(
                                                                      mainAxisSize: MainAxisSize.max,
                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                      children: [
                                                                        Text(
                                                                          _model.stagesdata![i].subStage ?? '',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'DM Sans',
                                                                                fontSize: 14,
                                                                                color: Color(0xFF444444),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w300,
                                                                              ),
                                                                        ),
                                                                        SizedBox(height: 4),
                                                                        Text(
                                                                          _model.stagesdata![i].completedAt == null
                                                                              ? '--'
                                                                              : DateFormat("dd-MM-yyyy hh:mm a").format(
                                                                                  DateTime.parse(_model
                                                                                      .stagesdata![i].completedAt!)),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'DM Sans',
                                                                                color: Color(0xFF444444),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w300,
                                                                                fontSize: 12,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          )
                                                        else if (_model.stagesdata![i].stage == 'Court proceedings' &&
                                                            _model.stagesdata![i].isCompleted == false)
                                                          Row(
                                                            children: [
                                                              ClipRRect(
                                                                borderRadius: BorderRadius.circular(0),
                                                                child: SvgPicture.asset(
                                                                  'assets/images/fi_833602.svg',
                                                                  fit: BoxFit.cover,
                                                                ),
                                                              ),
                                                              SizedBox(width: 8.7),
                                                              Column(
                                                                mainAxisSize: MainAxisSize.max,
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Text(
                                                                    _model.stagesdata![i].subStage ?? '',
                                                                    style: FlutterFlowTheme.of(context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily: 'DM Sans',
                                                                          color: Color(0xFF444444),
                                                                          letterSpacing: 0.0,
                                                                          fontWeight: FontWeight.w300,
                                                                          fontSize: 14,
                                                                        ),
                                                                  ),
                                                                  SizedBox(height: 4),
                                                                  Text(
                                                                    _model.stagesdata![i].completedAt == null
                                                                        ? '--'
                                                                        : DateFormat("dd-MM-yyyy hh:mm a").format(
                                                                            DateTime.parse(
                                                                                _model.stagesdata![i].completedAt!)),
                                                                    style: FlutterFlowTheme.of(context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily: 'DM Sans',
                                                                          color: Color(0xFF444444),
                                                                          letterSpacing: 0.0,
                                                                          fontWeight: FontWeight.w300,
                                                                          fontSize: 12,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                                  if (i < 17 && _model.stagesdata![i].stage == 'Court proceedings')
                                                    Padding(
                                                      padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                                      child: ClipRRect(
                                                        borderRadius: BorderRadius.circular(0),
                                                        child: Image.asset(
                                                          _model.stagesdata![i].isCompleted == true
                                                              ? 'assets/images/green_line.png'
                                                              : 'assets/images/orange_line.png',
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                          ].divide(SizedBox(height: 0)),
                                        ),
                                    ].divide(SizedBox(height: 5)),
                                  ),
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(0),
                                child: SvgPicture.asset(
                                  'assets/images/3_dots.svg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              // 5) Trail Phase
                              Container(
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
                                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              trailPhaseisUp = !trailPhaseisUp;
                                              if (trailPhaseisUp) {
                                                preBoardingisUp = false;
                                                onBoardingisUp = false;
                                                caseFilingisUp = false;
                                                courtProceedingsisUp = false;
                                                caseClosureisUp = false;
                                              }
                                            });
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Builder(
                                                    builder: (context) {
                                                      final trailPhaseStages = _model.stagesdata!
                                                          .where((stage) => stage.stage == 'Trail phase')
                                                          .toList();
                                                      final anyCompleted =
                                                          trailPhaseStages.any((stage) => stage.isCompleted == true);
                                                      final allCompleted =
                                                          trailPhaseStages.every((stage) => stage.isCompleted == true);
                                                      if (allCompleted) {
                                                        return Padding(
                                                          padding: const EdgeInsets.all(5.33),
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                              color: Color(0xFF4CAF50),
                                                            ),
                                                            child: Padding(
                                                              padding: EdgeInsets.all(7.33),
                                                              child: ClipRRect(
                                                                borderRadius: BorderRadius.circular(0),
                                                                child: SvgPicture.asset(
                                                                  color: Colors.white,
                                                                  'assets/images/check_1.svg',
                                                                  fit: BoxFit.cover,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      } else if (anyCompleted) {
                                                        return Padding(
                                                          padding: const EdgeInsets.all(4.0),
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                              color: Color(0xFFF2994A),
                                                            ),
                                                            child: Padding(
                                                              padding: EdgeInsets.all(4),
                                                              child: ClipRRect(
                                                                borderRadius: BorderRadius.circular(0),
                                                                child: SvgPicture.asset(
                                                                  'assets/images/trail_phase.svg',
                                                                  fit: BoxFit.cover,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      } else {
                                                        return Padding(
                                                          padding: const EdgeInsets.all(4.0),
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                              color: Color(0xFFFFFFFF),
                                                            ),
                                                            child: Padding(
                                                              padding: EdgeInsets.all(4),
                                                              child: ClipRRect(
                                                                borderRadius: BorderRadius.circular(0),
                                                                child: SvgPicture.asset(
                                                                  'assets/images/trail_phase.svg',
                                                                  fit: BoxFit.cover,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                    },
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.all(12.0),
                                                    child: Text(
                                                      'Trail Phase',
                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                            fontFamily: 'DM Sans',
                                                            fontWeight: FontWeight.w500,
                                                            color: Color(0xFF444444),
                                                            fontSize: 18,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(width: 10)),
                                              ),
                                              FaIcon(
                                                trailPhaseisUp ? FontAwesomeIcons.angleDown : FontAwesomeIcons.angleUp,
                                                color: FlutterFlowTheme.of(context).primaryText,
                                                size: 24,
                                              ),
                                            ].divide(SizedBox(width: 10)),
                                          ),
                                        ),
                                      ),
                                      if (trailPhaseisUp)
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            for (int i = 18; i < 28; i++)
                                              Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 4),
                                                    child: Row(
                                                      mainAxisSize: MainAxisSize.max,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        if (_model.stagesdata![i].stage == 'Trail phase' &&
                                                            _model.stagesdata![i].isCompleted == true)
                                                          Row(
                                                            mainAxisSize: MainAxisSize.max,
                                                            children: [
                                                              Container(
                                                                decoration: BoxDecoration(
                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                  border: Border.all(color: Color(0xFF27AE60)),
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
                                                              ),
                                                              SizedBox(width: 8.7),
                                                              Expanded(
                                                                child: Column(
                                                                  mainAxisSize: MainAxisSize.max,
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    Text(
                                                                      _model.stagesdata![i].subStage ?? '',
                                                                      style: FlutterFlowTheme.of(context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily: 'DM Sans',
                                                                            color: Color(0xFF444444),
                                                                            letterSpacing: 0.0,
                                                                            fontWeight: FontWeight.w300,
                                                                            fontSize: 14,
                                                                          ),
                                                                      maxLines: 2,
                                                                      overflow: TextOverflow.ellipsis,
                                                                    ),
                                                                    SizedBox(height: 4),
                                                                    Text(
                                                                      _model.stagesdata![i].completedAt == null
                                                                          ? '--'
                                                                          : DateFormat("dd-MM-yyyy hh:mm a").format(
                                                                              DateTime.parse(
                                                                                  _model.stagesdata![i].completedAt!)),
                                                                      style: FlutterFlowTheme.of(context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily: 'DM Sans',
                                                                            color: Color(0xFF444444),
                                                                            letterSpacing: 0.0,
                                                                            fontWeight: FontWeight.w300,
                                                                            fontSize: 12,
                                                                          ),
                                                                      overflow: TextOverflow.ellipsis,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          )
                                                        else if (_model.stagesdata![i].stage == 'Trail phase' &&
                                                            _model.stagesdata![i].isCompleted == false &&
                                                            (i == 17 || _model.stagesdata![i - 1].isCompleted == true))
                                                          Expanded(
                                                            child: Container(
                                                              decoration: BoxDecoration(
                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                border: Border.all(color: Color(0x66000000)),
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional.fromSTEB(6, 1, 6, 1),
                                                                child: Row(
                                                                  mainAxisSize: MainAxisSize.max,
                                                                  children: [
                                                                    ClipRRect(
                                                                      borderRadius: BorderRadius.circular(0),
                                                                      child: SvgPicture.asset(
                                                                        'assets/images/Component_24.svg',
                                                                        fit: BoxFit.cover,
                                                                      ),
                                                                    ),
                                                                    SizedBox(width: 8.7),
                                                                    Expanded(
                                                                      child: Column(
                                                                        mainAxisSize: MainAxisSize.max,
                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            _model.stagesdata![i].subStage ?? '',
                                                                            style: FlutterFlowTheme.of(context)
                                                                                .bodyMedium
                                                                                .override(
                                                                                  fontFamily: 'DM Sans',
                                                                                  fontSize: 14,
                                                                                  color: Color(0xFF444444),
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w300,
                                                                                ),
                                                                            maxLines: 2,
                                                                            overflow: TextOverflow.ellipsis,
                                                                          ),
                                                                          SizedBox(height: 4),
                                                                          Text(
                                                                            '--',
                                                                            style: FlutterFlowTheme.of(context)
                                                                                .bodyMedium
                                                                                .override(
                                                                                  fontFamily: 'DM Sans',
                                                                                  color: Color(0xFF444444),
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w300,
                                                                                  fontSize: 12,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          )
                                                        else if (_model.stagesdata![i].stage == 'Trail phase' &&
                                                            _model.stagesdata![i].isCompleted == false)
                                                          Expanded(
                                                            child: Row(
                                                              mainAxisSize: MainAxisSize.max,
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius: BorderRadius.circular(0),
                                                                  child: SvgPicture.asset(
                                                                    'assets/images/fi_833602.svg',
                                                                    fit: BoxFit.cover,
                                                                  ),
                                                                ),
                                                                SizedBox(width: 8.7),
                                                                Expanded(
                                                                  child: Column(
                                                                    mainAxisSize: MainAxisSize.max,
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children: [
                                                                      Text(
                                                                        _model.stagesdata![i].subStage ?? '',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'DM Sans',
                                                                              color: Color(0xFF444444),
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w300,
                                                                              fontSize: 14,
                                                                            ),
                                                                        maxLines: 2,
                                                                        overflow: TextOverflow.ellipsis,
                                                                      ),
                                                                      SizedBox(height: 4),
                                                                      Text(
                                                                        '--',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'DM Sans',
                                                                              color: Color(0xFF444444),
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w300,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                                  if (i < 27 && _model.stagesdata![i].stage == 'Trail phase')
                                                    Padding(
                                                      padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                                      child: ClipRRect(
                                                        borderRadius: BorderRadius.circular(0),
                                                        child: Image.asset(
                                                          _model.stagesdata![i].isCompleted == true
                                                              ? 'assets/images/green_line.png'
                                                              : 'assets/images/orange_line.png',
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                          ].divide(SizedBox(height: 0)),
                                        ),
                                    ].divide(SizedBox(height: 5)),
                                  ),
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(0),
                                child: SvgPicture.asset(
                                  'assets/images/3_dots.svg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              // 6) Case Closure
                              Container(
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
                                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              caseClosureisUp = !caseClosureisUp;
                                              if (caseClosureisUp) {
                                                preBoardingisUp = false;
                                                onBoardingisUp = false;
                                                caseFilingisUp = false;
                                                courtProceedingsisUp = false;
                                                trailPhaseisUp = false;
                                              }
                                            });
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Builder(
                                                    builder: (context) {
                                                      final caseClosureStages = _model.stagesdata!
                                                          .where((stage) => stage.stage == 'Case Closure')
                                                          .toList();
                                                      final anyCompleted =
                                                          caseClosureStages.any((stage) => stage.isCompleted == true);
                                                      final allCompleted =
                                                          caseClosureStages.every((stage) => stage.isCompleted == true);
                                                      if (allCompleted) {
                                                        return Padding(
                                                          padding: const EdgeInsets.all(5.33),
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                              color: Color(0xFF4CAF50),
                                                            ),
                                                            child: Padding(
                                                              padding: EdgeInsets.all(7.33),
                                                              child: ClipRRect(
                                                                borderRadius: BorderRadius.circular(0),
                                                                child: SvgPicture.asset(
                                                                  color: Colors.white,
                                                                  'assets/images/check_1.svg',
                                                                  fit: BoxFit.cover,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      } else if (anyCompleted) {
                                                        return Padding(
                                                          padding: const EdgeInsets.all(4.0),
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                              color: Color(0xFFF2994A),
                                                            ),
                                                            child: Padding(
                                                              padding: EdgeInsets.all(4),
                                                              child: ClipRRect(
                                                                borderRadius: BorderRadius.circular(0),
                                                                child: SvgPicture.asset(
                                                                  'assets/images/case_closure.svg',
                                                                  fit: BoxFit.cover,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      } else {
                                                        return Padding(
                                                          padding: const EdgeInsets.all(4.0),
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                              color: Color(0xFFFFFFFF),
                                                            ),
                                                            child: Padding(
                                                              padding: EdgeInsets.all(4),
                                                              child: ClipRRect(
                                                                borderRadius: BorderRadius.circular(0),
                                                                child: SvgPicture.asset(
                                                                  'assets/images/case_closure.svg',
                                                                  fit: BoxFit.cover,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                    },
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.all(12.0),
                                                    child: Text(
                                                      'Case Closure',
                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                            fontFamily: 'DM Sans',
                                                            fontWeight: FontWeight.w500,
                                                            color: Color(0xFF444444),
                                                            fontSize: 18,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(width: 10)),
                                              ),
                                              FaIcon(
                                                caseClosureisUp ? FontAwesomeIcons.angleDown : FontAwesomeIcons.angleUp,
                                                color: FlutterFlowTheme.of(context).primaryText,
                                                size: 24,
                                              ),
                                            ].divide(SizedBox(width: 10)),
                                          ),
                                        ),
                                      ),
                                      if (caseClosureisUp)
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            for (int i = 28; i < 32; i++)
                                              Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 4),
                                                    child: Row(
                                                      mainAxisSize: MainAxisSize.max,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        if (_model.stagesdata![i].stage == 'Case Closure' &&
                                                            _model.stagesdata![i].isCompleted == true)
                                                          Row(
                                                            children: [
                                                              Container(
                                                                decoration: BoxDecoration(
                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                  border: Border.all(color: Color(0xFF27AE60)),
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
                                                              ),
                                                              SizedBox(width: 8.7),
                                                              Expanded(
                                                                child: Column(
                                                                  mainAxisSize: MainAxisSize.max,
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    Text(
                                                                      _model.stagesdata![i].subStage ?? '',
                                                                      style: FlutterFlowTheme.of(context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily: 'DM Sans',
                                                                            fontSize: 14,
                                                                            color: Color(0xFF444444),
                                                                            letterSpacing: 0.0,
                                                                            fontWeight: FontWeight.w300,
                                                                          ),
                                                                    ),
                                                                    SizedBox(height: 4),
                                                                    Text(
                                                                      _model.stagesdata![i].completedAt == null
                                                                          ? '--'
                                                                          : DateFormat("dd-MM-yyyy hh:mm a").format(
                                                                              DateTime.parse(
                                                                                  _model.stagesdata![i].completedAt!)),
                                                                      style: FlutterFlowTheme.of(context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily: 'DM Sans',
                                                                            color: Color(0xFF444444),
                                                                            letterSpacing: 0.0,
                                                                            fontWeight: FontWeight.w300,
                                                                            fontSize: 12,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          )
                                                        else if (_model.stagesdata![i].stage == 'Case Closure' &&
                                                            _model.stagesdata![i].isCompleted == false &&
                                                            (i == 26 || _model.stagesdata![i - 1].isCompleted == true))
                                                          Expanded(
                                                            child: Container(
                                                              decoration: BoxDecoration(
                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                border: Border.all(color: Color(0x66000000)),
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional.fromSTEB(6, 1, 6, 1),
                                                                child: Row(
                                                                  mainAxisSize: MainAxisSize.max,
                                                                  children: [
                                                                    ClipRRect(
                                                                      borderRadius: BorderRadius.circular(0),
                                                                      child: SvgPicture.asset(
                                                                        'assets/images/Component_24.svg',
                                                                        fit: BoxFit.cover,
                                                                      ),
                                                                    ),
                                                                    SizedBox(width: 8.7),
                                                                    Expanded(
                                                                      child: Column(
                                                                        mainAxisSize: MainAxisSize.max,
                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            _model.stagesdata![i].subStage ?? '',
                                                                            style: FlutterFlowTheme.of(context)
                                                                                .bodyMedium
                                                                                .override(
                                                                                  fontFamily: 'DM Sans',
                                                                                  fontSize: 14,
                                                                                  color: Color(0xFF444444),
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w300,
                                                                                ),
                                                                          ),
                                                                          SizedBox(height: 4),
                                                                          Text(
                                                                            '--',
                                                                            style: FlutterFlowTheme.of(context)
                                                                                .bodyMedium
                                                                                .override(
                                                                                  fontFamily: 'DM Sans',
                                                                                  color: Color(0xFF444444),
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w300,
                                                                                  fontSize: 12,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          )
                                                        else if (_model.stagesdata![i].stage == 'Case Closure' &&
                                                            _model.stagesdata![i].isCompleted == false)
                                                          Expanded(
                                                            child: Row(
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius: BorderRadius.circular(0),
                                                                  child: SvgPicture.asset(
                                                                    'assets/images/fi_833602.svg',
                                                                    fit: BoxFit.cover,
                                                                  ),
                                                                ),
                                                                SizedBox(width: 8.7),
                                                                Expanded(
                                                                  child: Column(
                                                                    mainAxisSize: MainAxisSize.max,
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children: [
                                                                      Text(
                                                                        maxLines: 2,
                                                                        _model.stagesdata![i].subStage ?? '',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'DM Sans',
                                                                              color: Color(0xFF444444),
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w300,
                                                                              fontSize: 14,
                                                                            ),
                                                                      ),
                                                                      SizedBox(height: 4),
                                                                      Text(
                                                                        '--',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'DM Sans',
                                                                              color: Color(0xFF444444),
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w300,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                                  if (i < 31 && _model.stagesdata![i].stage == 'Case Closure')
                                                    Padding(
                                                      padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                                      child: ClipRRect(
                                                        borderRadius: BorderRadius.circular(0),
                                                        child: Image.asset(
                                                          _model.stagesdata![i].isCompleted == true
                                                              ? 'assets/images/green_line.png'
                                                              : 'assets/images/orange_line.png',
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                          ].divide(SizedBox(height: 0)),
                                        ),
                                    ].divide(SizedBox(height: 5)),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }
                      },
                    ),
                  ),
                )
              ].divide(SizedBox(height: 0)).addToEnd(SizedBox(height: 0)),
            ),
          ),
        ),
      ),
    );
  }
}
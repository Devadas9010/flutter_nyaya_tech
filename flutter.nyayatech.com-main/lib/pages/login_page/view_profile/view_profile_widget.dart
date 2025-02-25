import 'package:docx_file_viewer/docx_file_viewer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:nyaya_tech/data_components/shared_prefernce.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_theme.dart';
import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';
import 'package:nyaya_tech/pages/login_page/add_profile/add_profile_widget.dart';
import 'package:nyaya_tech/pages/login_page/edit_profile/edit_profile_widget.dart';
import 'package:nyaya_tech/pages/login_page/view_profile/view_profile_model.dart';

class ViewProfileInformationWidget extends StatefulWidget {
  const ViewProfileInformationWidget({super.key});

  @override
  State<ViewProfileInformationWidget> createState() =>
      _ViewProfileInformationWidgetState();
}

class _ViewProfileInformationWidgetState
    extends State<ViewProfileInformationWidget> {
  late ViewProfileInformationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViewProfileInformationModel());
    print('url -- ${SharedPrefernce.gets3Url()}');
    print('file key -- ${SharedPrefernce.getfileKey()}');
  }

  Future<void> fetchViewCase() async {
    await _model.fetchViewUserProfile();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String capitalizeFirstLetter(String text) {
      if (text.isEmpty) return text;
      return text[0].toUpperCase() + text.substring(1).toLowerCase();
    }

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
            top: true,
            child: FutureBuilder(
                future: fetchViewCase(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                        child: Lottie.asset(
                            'assets/lottie_animations/loading_animation.json',
                            width: 150,
                            height: 150));
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
                          Text('No-Connection',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500))
                        ],
                      ),
                    );
                  } else {
                    return SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    Get.back();
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(8),
                                      child: Icon(
                                        Icons.arrow_back,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  'Profile',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'DM Sans',
                                        color: Color(0xFF181616),
                                        fontSize: 16,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      _model.viewuser!.address == null
                                          ? Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      AddUserWidget()))
                                          : Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      EditUserWidget()));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Padding(
                                        padding: EdgeInsets.all(8),
                                        child: FaIcon(
                                          FontAwesomeIcons.edit,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(0),
                                    child: _model.viewuser!.profilePic !=
                                                null &&
                                            _model.viewuser!.profilePic!
                                                .isNotEmpty
                                        ? Image.network(
                                            '${_model.viewuser!.profilePic}',
                                            height: 97,
                                            width: 97,
                                            fit: BoxFit.cover)
                                        : SvgPicture.asset(
                                            'assets/images/no_Profile_user.svg',
                                            fit: BoxFit.cover)),
                                Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Customer Id'),
                                      Text(_model.viewuser!.customerId ?? '--')
                                    ].divide(SizedBox(height: 8)),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'Bio',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'DM Sans',
                                                color: Color(0xFF181616),
                                                fontSize: 18,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ].divide(SizedBox(width: 8)),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                _model.viewuser!.bio ?? '--',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                        fontFamily: 'DM Sans',
                                                        letterSpacing: 0.0,
                                                        color: Colors.black),
                                              ),
                                            ].divide(SizedBox(height: 6)),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 12)),
                                    ),
                                  ].divide(SizedBox(height: 16)),
                                ),
                                Divider(
                                  thickness: 2,
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(2),
                                            child: Icon(
                                              Icons.contact_mail,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              size: 16,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Personal Details',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'DM Sans',
                                                color: Color(0xFF181616),
                                                fontSize: 18,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ].divide(SizedBox(width: 8)),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'First Name',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                        fontFamily: 'DM Sans',
                                                        letterSpacing: 0.0,
                                                        color:
                                                            Color(0XFF828282)),
                                              ),
                                              Text(
                                                _model.viewuser!.firstName ??
                                                    '--',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'DM Sans',
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ].divide(SizedBox(height: 6)),
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Last Name',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'DM Sans',
                                                          color:
                                                              Color(0xFF828282),
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Text(
                                                _model.viewuser!.lastName ??
                                                    '--',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'DM Sans',
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ].divide(SizedBox(height: 6)),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 12)),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Date Of Birth',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                        fontFamily: 'DM Sans',
                                                        letterSpacing: 0.0,
                                                        color:
                                                            Color(0XFF828282)),
                                              ),
                                              Text(
                                                _model.viewuser!.dateOfBirth ==
                                                        null
                                                    ? '--'
                                                    : DateFormat('MM-dd-yyyy')
                                                        .format(DateTime.parse(
                                                            _model.viewuser!
                                                                .dateOfBirth
                                                                .toString())),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'DM Sans',
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ].divide(SizedBox(height: 6)),
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Gender',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'DM Sans',
                                                          color:
                                                              Color(0xFF828282),
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Text(
                                                capitalizeFirstLetter(_model
                                                    .viewuser!.gender
                                                    .toString()),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'DM Sans',
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ].divide(SizedBox(height: 6)),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 12)),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Aadhaar No',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'DM Sans',
                                                        color:
                                                            Color(0xFF828282),
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Text(
                                              _model.viewuser!.aadhaar ?? '--',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'DM Sans',
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ].divide(SizedBox(height: 6)),
                                        ),
                                      ],
                                    ),
                                  ].divide(SizedBox(height: 16)),
                                ),
                                Divider(
                                  thickness: 2,
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(2),
                                            child: Icon(
                                              Icons.location_on,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              size: 16,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Address',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'DM Sans',
                                                color: Color(0xFF181616),
                                                fontSize: 18,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ].divide(SizedBox(width: 8)),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Residential Address',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                        fontFamily: 'DM Sans',
                                                        letterSpacing: 0.0,
                                                        color:
                                                            Color(0XFF828282)),
                                              ),
                                              Text(
                                                _model.viewuser!.address ??
                                                    '--',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'DM Sans',
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Text(
                                                'State',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                        fontFamily: 'DM Sans',
                                                        letterSpacing: 0.0,
                                                        color:
                                                            Color(0XFF828282)),
                                              ),
                                              Text(
                                                _model.viewuser!.state ?? '--',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'DM Sans',
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ].divide(SizedBox(height: 6)),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 12)),
                                    ),
                                  ].divide(SizedBox(height: 16)),
                                ),
                                Divider(
                                  thickness: 2,
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(2),
                                            child: Icon(
                                              Icons.person_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              size: 16,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Contact',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'DM Sans',
                                                color: Color(0xFF181616),
                                                fontSize: 18,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ].divide(SizedBox(width: 8)),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Email',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                        fontFamily: 'DM Sans',
                                                        letterSpacing: 0.0,
                                                        color:
                                                            Color(0XFF828282)),
                                              ),
                                              Text(
                                                _model.viewuser!.email ?? '--',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'DM Sans',
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ].divide(SizedBox(height: 6)),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 12)),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Phone',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                        fontFamily: 'DM Sans',
                                                        letterSpacing: 0.0,
                                                        color:
                                                            Color(0XFF828282)),
                                              ),
                                              Text(
                                                _model.viewuser!.phone ?? '--',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'DM Sans',
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ].divide(SizedBox(height: 6)),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 12)),
                                    ),
                                  ].divide(SizedBox(height: 16)),
                                ),
                                Divider(
                                  thickness: 2,
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'Professional details',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'DM Sans',
                                                color: Color(0xFF181616),
                                                fontSize: 18,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ].divide(SizedBox(width: 8)),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Qualification',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                        fontFamily: 'DM Sans',
                                                        letterSpacing: 0.0,
                                                        color:
                                                            Color(0XFF828282)),
                                              ),
                                              Text(
                                                _model.viewuser!
                                                        .qualification ??
                                                    '--',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'DM Sans',
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Text(
                                                'Occupation',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                        fontFamily: 'DM Sans',
                                                        letterSpacing: 0.0,
                                                        color:
                                                            Color(0XFF828282)),
                                              ),
                                              Text(
                                                _model.viewuser!.occupation ??
                                                    '--',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'DM Sans',
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ].divide(SizedBox(height: 8)),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 12)),
                                    ),
                                  ].divide(SizedBox(height: 16)),
                                ),
                              ].divide(SizedBox(height: 24)),
                            ),
                          ]
                              .divide(SizedBox(height: 32))
                              .addToStart(SizedBox(height: 12)),
                        ),
                      ),
                    );
                  }
                })),
      ),
    );
  }
}

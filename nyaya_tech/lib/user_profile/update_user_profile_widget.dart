import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:nyaya_tech/data_components/shared_preference.dart';

import 'package:nyaya_tech/data_components/text_field_components.dart';
import 'package:nyaya_tech/responses/view_user_profile_response.dart';

import 'package:nyaya_tech/user_profile/update_user_profile_model.dart';
import 'package:nyaya_tech/user_profile/user_profile_widget.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UpdateUserProfileWidget extends StatefulWidget {
  const UpdateUserProfileWidget({super.key});

  @override
  State<UpdateUserProfileWidget> createState() =>
      _UpdateUserProfileWidgetState();
}

class _UpdateUserProfileWidgetState extends State<UpdateUserProfileWidget> {
  late UpdateUserProfileModel _model;
  ViewProfileData? viewuser;

  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  TextEditingController controller5 = TextEditingController();
  TextEditingController controller6 = TextEditingController();
  TextEditingController controller7 = TextEditingController();
  String date = '';
  String selectedGender = '';
  bool showGenderError = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UpdateUserProfileModel());
    String dateOfBirth = SharedPrefernce.getDateOfBirth();
    DateTime dob = DateTime.parse(dateOfBirth);

    controller1.text = SharedPrefernce.getFirstName();
    controller2.text = SharedPrefernce.getlastName();
    controller3.text = SharedPrefernce.getEmail();
    controller4.text = SharedPrefernce.getcreatePhone();
    controller5.text = SharedPrefernce.getAddress();
    controller6.text = DateFormat('dd-MM-yyyy').format(dob);
    controller7.text = SharedPrefernce.getGender();
  }

  Future<void> selectedDate(TextEditingController controller6) async {
    DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        controller6.text = DateFormat('dd-MM-yyyy').format(picked);
      });
    }
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Icon(
                              Icons.arrow_back,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'Edit Profile',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'DM Sans',
                            fontSize: 16,
                            letterSpacing: 0,
                          ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        setState(() {
                          isLoading = true;
                        });
                        await _model.fetchUpdateUser(
                          userid: SharedPrefernce.getprofileid(),
                          firstName: controller1.text.trim(),
                          lastName: controller2.text.trim(),
                          email: controller3.text.trim(),
                          phone: controller4.text.trim(),
                          address: controller5.text.trim(),
                          dateOfBirth: controller6?.text?? '--',
                          gender: selectedGender,
                        );
                        setState(() {
                          isLoading = false;
                        });
                        if (_model.message.isNotEmpty) {
                          Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  const UserProfileWidget(),
                            ),
                          );
                          //context.pushNamed('bottomBar');
                          // Get.toNamed(Routes.bottombar,
                          //     arguments: {'currentIndex': 2});
                        } else if (selectedGender.isEmpty) {
                          setState(() {
                            showGenderError = true;
                          });
                        }
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(0),
                        child: isLoading
                            ? SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                    color: Colors.black, strokeWidth: 2),
                              )
                            : SvgPicture.asset('assets/images/done_mark.svg',
                                width: 36, height: 36, fit: BoxFit.cover),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Flexible(
                          child: TextFieldComponent(
                            controller: controller1,
                            errorKey: 'first_name',
                            errors: _model.errorInstance1,
                            hintText: 'First Name',
                            label: 'First Name',
                            maxLine: 1,
                          ),
                        ),
                        Flexible(
                          child: TextFieldComponent(
                              controller: controller2,
                              hintText: 'Last Name',
                              label: 'Last Name',
                              errors: _model.errorInstance2,
                              maxLine: 1,
                              errorKey: 'last_name'),
                        ),
                      ].divide(SizedBox(width: 16)),
                    ),
                    Flexible(
                      child: TextFieldComponent(
                          controller: controller3,
                          errorKey: 'email',
                          errors: _model.errorInstance3,
                          hintText: 'Email',
                          label: 'Email',
                          maxLine: 1),
                    ),
                    Flexible(
                      child: TextFieldComponent(
                          controller: controller4,
                          hintText: 'Phone',
                          label: 'Phone',
                          maxLine: 1,
                          errors: _model.errorinstance4,
                          errorKey: 'phone'),
                    ),
                    Flexible(
                      child: TextFieldComponent(
                        controller: controller5,
                        errorKey: 'address',
                        errors: _model.errorinstance5,
                        hintText: 'Address',
                        label: 'Residencial Address',
                        maxLine: 1,
                      ),
                    ),
                    Flexible(
                        child: TextFormField(
                      onTap: () async {
                        await selectedDate(controller6);
                      },
                      //controller: controller6,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFF3F9FF),
                        suffixIconColor: Colors.black,
                        errorStyle: TextStyle(color: Colors.red),
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                        labelText: 'Date Of Birth',
                        hintText: 'Enter your date of birth',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1.0,
                          ),
                        ),
                      ),
                      readOnly: true,
                    )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _genderContainer('male', 'Male'),
                        _genderContainer('female', 'Female'),
                        _genderContainer('other', 'Other'),
                      ],
                    ),
                    if (showGenderError) ...[
                      SizedBox(height: 8),
                      Text(
                        'Please select a gender',
                        style: TextStyle(color: Colors.red, fontSize: 12),
                      ),
                    ],
                  ].divide(SizedBox(height: 16)),
                ),
              ].divide(SizedBox(height: 32)),
            ),
          ),
        ),
      ),
    );
  }

  Widget _genderContainer(String gender, String label) {
    bool isSelected = (selectedGender == gender);

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedGender = gender; // Update the selected gender
          showGenderError = false; // Hide any error when gender is selected
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          border: Border.all(
            color: isSelected ? Color(0xFFE0E0E0) : Colors.white,
          ),
          borderRadius: BorderRadius.circular(0),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16, 10, 16, 10),
          child: Row(
            children: [
              Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: isSelected ? Colors.black : Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black, width: 2),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                label,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'DM Sans',
                      color: const Color(
                          0xFF181616), // Ensure consistent color format.
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

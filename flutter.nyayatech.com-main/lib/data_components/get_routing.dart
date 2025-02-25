import 'package:get/get.dart';
import 'package:nyaya_tech/data_components/bottom_bar.dart';
import 'package:nyaya_tech/index.dart';
import 'package:nyaya_tech/pages/login/edit_phone.dart';
import 'package:nyaya_tech/pages/login_page/Profile/profile_widget.dart';
import 'package:nyaya_tech/pages/login_page/add_hearing_summary/update_summary_widget.dart';
import 'package:nyaya_tech/pages/login_page/add_notes/update_notes_widget.dart';
import 'package:nyaya_tech/pages/login_page/description/description_widget.dart';
import 'package:nyaya_tech/pages/login_page/description/other_issue/other_issue_widget.dart';
import 'package:nyaya_tech/pages/login_page/add_profile/add_profile_widget.dart';
import 'package:nyaya_tech/pages/login_page/files/preview_widget.dart';
import 'package:nyaya_tech/pages/login_page/otp_page/otp_page_widget.dart';
import 'package:nyaya_tech/pages/login_page/stages_screen/stage_screen_widget.dart';
import 'package:nyaya_tech/pages/login_page/view_checklist/view_checklist_widget.dart';
import 'package:nyaya_tech/pages/login_page/view_profile/view_profile_widget.dart';
import 'package:nyaya_tech/pages/login_page/welcome/welcome_widget.dart';

class Routes {
  static const String login = '/login';
  static const String bottombar = '/bottombar';
  static const String casepage = '/casepage';
  static const String addnotes = '/addnotes';
  static const String addhearing = '/addhearing';
  static const String viewcase = '/viewcase';
  static const String files = '/files';
  static const String addNotes = '/addNotes';
  static const String addHearingNotes = '/addHearingNotes';
  static const String viewNotes = '/viewNotes';
  static const String viewHearingNotes = '/ViewHearingNotes';
  static const String step1 = '/step1';
  static const String step2 = '/step2';
  static const String step3 = '/step3';
  static const String otpPage = '/otpPage';
  static const String description = '/description';
  static const String notes = '/notes';
  static const String summary = '/summary';
  static const String otherissue = '/otherissue';
  static const String editprofile = '/editProfile';
  static const String profile = '/profile';
  static const String welcome = '/welcome';
  static const String editNote = '/editnote';
  static const String editSummary = '/editSummary';
  static const String preview = '/preview';
  static const String editPhone = '/EditPhone';
  static const String viewCheckList = '/viewCheckList';
  static const String viewProfile = '/viewProfile';
  static const String stageScreen = '/statusScreen';
}

final getPages = [
  GetPage(
      name: Routes.login,
      page: () => LoginPageWidget(),
      transition: Transition.fade,
      transitionDuration: Duration(milliseconds: 300)),
  GetPage(
      name: Routes.bottombar,
      page: () => SalomonBottom(),
      transition: Transition.fade,
      transitionDuration: Duration(microseconds: 300)),
  GetPage(
      name: Routes.casepage,
      page: () => CasesWidget(),
      transition: Transition.fade,
      transitionDuration: Duration(microseconds: 300)),
  GetPage(
      name: Routes.addnotes,
      page: () => AddNotesWidget(),
      transition: Transition.fade,
      transitionDuration: Duration(microseconds: 300)),
  GetPage(
      name: Routes.addhearing,
      page: () => AddHearingSummaryWidget(),
      transition: Transition.fade,
      transitionDuration: Duration(microseconds: 300)),
  GetPage(
      name: Routes.viewcase,
      page: () => ViewCaseWidget(),
      transition: Transition.fade,
      transitionDuration: Duration(microseconds: 300)),
  GetPage(
      name: Routes.files,
      page: () => FilesWidget(),
      transition: Transition.fade,
      transitionDuration: Duration(microseconds: 300)),
  GetPage(
      name: Routes.addNotes,
      page: () => AddNotesWidget(),
      transition: Transition.fade,
      transitionDuration: Duration(microseconds: 300)),
  GetPage(
      name: Routes.addHearingNotes,
      page: () => AddHearingSummaryWidget(),
      transition: Transition.fade,
      transitionDuration: Duration(microseconds: 300)),
  GetPage(
      name: Routes.viewNotes,
      page: () => ViewNotesWidget(),
      transition: Transition.fade,
      transitionDuration: Duration(microseconds: 300)),
  GetPage(
      name: Routes.viewHearingNotes,
      page: () => ViewHearingSummaryWidget(),
      transition: Transition.fade,
      transitionDuration: Duration(microseconds: 300)),
  // GetPage(
  //     name: Routes.step1,
  //     page: () => Step1ScreenWidget(),
  //     transition: Transition.fade),
  // GetPage(
  //     name: Routes.step2,
  //     page: () => Step2ScreenWidget(),
  //     transition: Transition.rightToLeft),
  // GetPage(
  //     name: Routes.step3,
  //     page: () => Step3ScreenWidget(),
  //     transition: Transition.rightToLeft),
  GetPage(
      name: Routes.otpPage,
      page: () => OtpPageWidget(),
      transition: Transition.rightToLeft),
  GetPage(
      name: Routes.description,
      page: () => DescriptionWidget(),
      transition: Transition.rightToLeft),
  GetPage(
      name: Routes.notes,
      page: () => NotesScreenWidget(),
      transition: Transition.fade),
  GetPage(
      name: Routes.summary,
      page: () => HearingSummaryWidget(),
      transition: Transition.fadeIn),
  GetPage(
      name: Routes.otherissue,
      page: () => OtherIssues(),
      transition: Transition.fadeIn),
  GetPage(
      name: Routes.editprofile,
      page: () => AddUserWidget(),
      transition: Transition.fadeIn),
  GetPage(
      name: Routes.profile,
      page: () => UserProfileWidget(),
      transition: Transition.fadeIn),
  GetPage(
      name: Routes.welcome,
      page: () => WelcomeScreenWidget(),
      transition: Transition.fadeIn),
  GetPage(
      name: Routes.editNote,
      page: () => UpdateNotesWidget(),
      transition: Transition.fadeIn),
  GetPage(
      name: Routes.editSummary,
      page: () => UpdateSummaryWidget(),
      transition: Transition.fadeIn),
  GetPage(
      name: Routes.editPhone,
      page: () => EditWidget(),
      transition: Transition.fadeIn),
  GetPage(
      name: Routes.preview,
      page: () => PreviewWidget(),
      transition: Transition.fadeIn),
  GetPage(
      name: Routes.viewCheckList,
      page: () => VIewchecklistWidget(),
      transition: Transition.fadeIn),
  GetPage(
      name: Routes.viewProfile,
      page: () => ViewProfileInformationWidget(),
      transition: Transition.fadeIn),
  GetPage(
      name: Routes.stageScreen,
      page: () => StatusProductsWidget(),
     transition: Transition.fade)
];

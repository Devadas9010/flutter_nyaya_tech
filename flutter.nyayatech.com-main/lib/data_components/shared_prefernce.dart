import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefernce {
  static late SharedPreferences preferences;
  static const String accessToken = 'accesstoken';
  static const String userType = 'userType';
  static const String caseId = 'caseId';
  static const String notesId = 'notesId';
  static const String fileId = 'fileId';
  static const String email = 'email';
  static const String summarydate = 'summaryDate';
  static const String summaryid = 'summaryId';
  static const String dataListKey = 'dataList';
  static const String servicetitle = 'servicetitle';
  static const String casetitle = 'casetitle';
  static const String issuetitle = 'issuetitle';
  static const String assigneLawId = 'assigneLawId';
  static const String isNewUser = 'isNewUser';
  static const String loginId = 'loginId';
  static const String profileid = 'profileid';
  static const String createPhone = 'createPhone';
  static const String noteTitle = 'noteTitle';
  static const String noteText = 'noteText';
  static const String summarydateUp = 'summarydateup';
  static const String summaryText = 'summaryText';
  static const String s3Url = 's3Url';
  static const String fileKey = 'fileKey';
  static const String commentId = 'commentId';
  static const String userName = 'userName';
  static const String firstName = 'firstName';
  static const String secondName = 'secondName';
  static const String serviceLogo = 'serviceLogo';
  static const String checkListId = 'checkListId';
  static const String casesStatus = 'casesStatus';
  static const String fcmToken = 'fcmToken';
  static const String address = 'address';
  static const String gender = 'gender';
  static const String state = 'state';
  static const String dateOfBirth = 'dateOfBirth';
  static const String profilekey = 'profilekey';
  static const String profileFilekey = 'profileFileKey';
  static const String bio = "bio";
  static const String aaddhar = "aaddhar";
  static const String qulification = 'qulaification';
  static const String occupation = 'occupation';
    static const String s3Urlcam = 's3Urlcam';
  static const String fileKeycam = 'fileKeycam';  
  static const String s3Urlfiles= 's3Urlfiles';
  static const String fileKeyfiles = 'fileKey';

  static Future<SharedPreferences> init() async {
    preferences = await SharedPreferences.getInstance();
    return preferences;
  }

  ///Method that saves the [accessToken].
  static Future<bool> setAccessToken(String value) async =>
      preferences.setString(accessToken, value);

  ///Method that returns the [accessToken].
  static String getAccessToken() => preferences.getString(accessToken) ?? '';

  ///Method that saves the [userType].
  static Future<bool> setUsertype(String value) async =>
      preferences.setString(userType, value);

  ///Method that returns the [userType].
  static String getUsertype() => preferences.getString(userType) ?? '';

  ///Method that saves the [email].
  static Future<bool> setemail(String value) async =>
      preferences.setString(email, value);

  ///Method that returns the [email].
  static String getemail() => preferences.getString(email) ?? '';

  ///Method that saves the [caseId].
  static Future<bool> setcaseId(int value) async =>
      preferences.setInt(caseId, value);

  ///Method that returns the [caseId].
  static int getcaseId() => preferences.getInt(caseId) ?? 0;

  ///Method that saves the [notesId].
  static Future<bool> setnotesId(String value) async =>
      preferences.setString(notesId, value);

  ///Method that returns the [notesId].
  static String getnotesId() => preferences.getString(notesId) ?? '';

  ///Method that saves the [fileId].
  static Future<bool> setfileId(String value) async =>
      preferences.setString(fileId, value);

  ///Method that returns the [fileId].
  static String getfileId() => preferences.getString(fileId) ?? '';

  ///Method that saves the [summarydate].
  static Future<bool> setSummary(String value) async =>
      preferences.setString(summarydate, value);

  ///Method that returns the [summarydate].
  static String getSummary() => preferences.getString(summarydate) ?? '';

  ///Method that saves the [summaryid].
  static Future<bool> setsummaryid(String value) async =>
      preferences.setString(summaryid, value);

  ///Method that returns the [summaryid].
  static String getsummaryid() => preferences.getString(summaryid) ?? '';

  ///Method that saves the [servicetitle].
  static Future<bool> setservicetitle(String value) async =>
      preferences.setString(servicetitle, value);

  ///Method that returns the [servicetitle].
  static String getservicetitle() => preferences.getString(servicetitle) ?? '';

  ///Method that saves the [casetitle].
  static Future<bool> setcasetitle(String value) async =>
      preferences.setString(casetitle, value);

  ///Method that returns the [casetitle].
  static String getcasetitle() => preferences.getString(casetitle) ?? '';

  ///Method that saves the [issuetitle].
  static Future<bool> setissuetitle(String value) async =>
      preferences.setString(issuetitle, value);

  ///Method that returns the [issuetitle].
  static String getissuetitle() => preferences.getString(issuetitle) ?? '';

  ///Method that saves the [assigneLawId].
  static Future<bool> setassigneLawId(String value) async =>
      preferences.setString(assigneLawId, value);

  ///Method that returns the [assigneLawId].
  static String getassigneLawId() => preferences.getString(assigneLawId) ?? '';

  ///Method that saves the [isNewUser].
  static Future<bool> setisNewUser(bool value) async =>
      preferences.setBool(isNewUser, value);

  ///Method that returns the [isNewUser].
  static bool getisNewUser() => preferences.getBool(isNewUser) ?? false;

  ///Method that saves the [loginId].
  static Future<bool> setloginId(int value) async =>
      preferences.setInt(loginId, value);

  ///Method that returns the [loginId].
  static int getloginId() => preferences.getInt(loginId) ?? 0;

  ///Method that saves the [profileid].
  static Future<bool> setprofileid(int value) async =>
      preferences.setInt(profileid, value);

  ///Method that returns the [profileid].
  static int getprofileid() => preferences.getInt(profileid) ?? 0;

  ///Method that saves the [createPhone].
  static Future<bool> setcreatePhone(String value) async =>
      preferences.setString(createPhone, value);

  ///Method that returns the [createPhone].
  static String getcreatePhone() => preferences.getString(createPhone) ?? '';

  ///Method that saves the [noteTitle].
  static Future<bool> setnoteTitle(String value) async =>
      preferences.setString(noteTitle, value);

  ///Method that returns the [noteTitle].
  static String getnoteTitle() => preferences.getString(noteTitle) ?? '';

  ///Method that saves the [noteText].
  static Future<bool> setnoteText(String value) async =>
      preferences.setString(noteText, value);

  ///Method that returns the [noteText].
  static String getnoteText() => preferences.getString(noteText) ?? '';

  ///Method that saves the [summarydateUp].
  static Future<bool> setSummaryUp(String value) async =>
      preferences.setString(summarydateUp, value);

  ///Method that returns the [summarydateUp].
  static String getSummaryUp() => preferences.getString(summarydateUp) ?? '';

  ///Method that saves the [summaryText].
  static Future<bool> setsummaryText(String value) async =>
      preferences.setString(summaryText, value);

  ///Method that returns the [summaryText].
  static String getsummaryText() => preferences.getString(summaryText) ?? '';

  ///Method that saves the [s3Url].
  static Future<bool> sets3Url(String value) async =>
      preferences.setString(s3Url, value);

  ///Method that returns the [s3Url].
  static String gets3Url() => preferences.getString(s3Url) ?? '';

  ///Method that saves the [fileKey].
  static Future<bool> setfileKey(String value) async =>
      preferences.setString(fileKey, value);

  ///Method that returns the [fileKey].
  static String getfileKey() => preferences.getString(fileKey) ?? '';

  ///Method that saves the [commentId].
  static Future<bool> setcommentId(int value) async =>
      preferences.setInt(commentId, value);

  ///Method that returns the [commentId].
  static int getcommentId() => preferences.getInt(commentId) ?? 0;

  /// Method that saves the [userName].
  static Future<bool> setuserName(String value) async =>
      preferences.setString(userName, value);

  /// Method that returns the [userName].
  static String? getuserName() => preferences.getString(userName);

  ///Method that saves the [firstName].
  static Future<bool> setfirstName(String value) async =>
      preferences.setString(firstName, value);

  ///Method that returns the [firstName].
  static String getfirstName() => preferences.getString(firstName) ?? '';

  ///Method that saves the [secondName].
  static Future<bool> setsecondName(String value) async =>
      preferences.setString(secondName, value);

  ///Method that returns the [secondName].
  static String getsecondName() => preferences.getString(secondName) ?? '';

  ///Method that saves the [serviceLogo].
  static Future<bool> setservicelogo(String value) async =>
      preferences.setString(serviceLogo, value);

  ///Method that returns the [serviceLogo].
  static String getservicelogo() => preferences.getString(serviceLogo) ?? '';

  ///Method that saves the [checkListId].
  static Future<bool> setCheckListId(String value) async =>
      preferences.setString(checkListId, value);

  ///Method that returns the [checkListId].
  static String getcheckListId() => preferences.getString(checkListId) ?? '';

  ///Method that saves the [casesStatus].
  static Future<bool> setcasesStatus(String value) async =>
      preferences.setString(casesStatus, value);

  ///Method that returns the [casesStatus].
  static String getcasesStatus() => preferences.getString(casesStatus) ?? '';

  ///Method that saves the [fcmToken].
  static Future<bool> setfcmToken(String value) async =>
      preferences.setString(fcmToken, value);

  ///Method that returns the [fcmToken].
  static String getfcmToken() => preferences.getString(fcmToken) ?? '';

  ///Method that saves the [address].
  static Future<bool> setAddress(String value) async =>
      preferences.setString(address, value);

  ///Method that returns the [address].
  static String getAddress() => preferences.getString(address) ?? '';

  ///Method that saves the [gender].
  static Future<bool> setgender(String value) async =>
      preferences.setString(gender, value);

  ///Method that returns the [gender].
  static String getgender() => preferences.getString(gender) ?? '';

  ///Method that saves the [state].
  static Future<bool> setstates(String value) async =>
      preferences.setString(state, value);

  ///Method that returns the [state].
  static String getstates() => preferences.getString(state) ?? '';

  ///Method that saves the [dateOfBirth].
  static Future<bool> setdateOfBirth(String value) async =>
      preferences.setString(dateOfBirth, value);

  ///Method that returns the [dateOfBirth].
  static String getdateOfBirth() => preferences.getString(dateOfBirth) ?? '';

  ///Method that saves the [profilekey].
  static Future<bool> setprofilekey(String value) async =>
      preferences.setString(profilekey, value);

  ///Method that returns the [profilekey].
  static String getprofilekey() => preferences.getString(profilekey) ?? '';

  ///Method that saves the [profileFilekey].
  static Future<bool> setprofileFilekey(String value) async =>
      preferences.setString(profileFilekey, value);

  ///Method that returns the [profileFilekey].
  static String getprofileFilekey() =>
      preferences.getString(profileFilekey) ?? '';

  ///Method that saves the [bio].
  static Future<bool> setbio(String value) async =>
      preferences.setString(bio, value);

  ///Method that returns the [bio].
  static String getbio() => preferences.getString(bio) ?? '';

  ///Method that saves the [aaddhar].
  static Future<bool> setaaddhar(String value) async =>
      preferences.setString(aaddhar, value);

  ///Method that returns the [aaddhar].
  static String getaaddhar() => preferences.getString(aaddhar) ?? '';

    ///Method that saves the [qulification].
  static Future<bool> setqulification(String value) async =>
      preferences.setString(qulification, value);

  ///Method that returns the [qulification].
  static String getqulification() => preferences.getString(qulification) ?? '';

      ///Method that saves the [occupation].
  static Future<bool> setoccupation(String value) async =>
      preferences.setString(occupation, value);

  ///Method that returns the [occupation].
  static String getoccupation() => preferences.getString(occupation) ?? '';

    ///Method that saves the [s3Urlcam].
  static Future<bool> sets3Urlcam(String value) async =>
      preferences.setString(s3Urlcam, value);

  ///Method that returns the [s3Urlcam].
  static String gets3Urlcam() => preferences.getString(s3Urlcam) ?? '';

  ///Method that saves the [fileKeycam].
  static Future<bool> setfileKeycam(String value) async =>
      preferences.setString(fileKeycam, value);

  ///Method that returns the [fileKeycam].
  static String getfileKeycam() => preferences.getString(fileKeycam) ?? '';

      ///Method that saves the [s3Urlfiles].
  static Future<bool> sets3Urlfiles(String value) async =>
      preferences.setString(s3Urlfiles, value);

  ///Method that returns the [s3Urlfiles].
  static String gets3Urlfiles() => preferences.getString(s3Urlfiles) ?? '';

  ///Method that saves the [fileKeyfiles].
  static Future<bool> setfileKeyfiles(String value) async =>
      preferences.setString(fileKeyfiles, value);

  ///Method that returns the [fileKeyfiles].
  static String getfileKeyfiles() => preferences.getString(fileKeyfiles) ?? '';

  static Future<bool> setDataList(List<Map<String, String>> dataList) async {
    String jsonString = jsonEncode(dataList);
    return preferences.setString(dataListKey, jsonString);
  }

  // static List<Map<String, String>> getDataList() {
  //   String? jsonString = preferences.getString(dataListKey);
  //   List<dynamic> jsonList = jsonDecode(jsonString);
  //   return jsonList.map((e) => Map<String, String>.from(e)).toList();
  //     return [];
  // }

  static Future<bool> remove(String key) async => await preferences.remove(key);

  static Future<bool> clear() async => await preferences.clear();
}

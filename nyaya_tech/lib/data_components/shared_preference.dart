import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefernce {
  static late SharedPreferences preferences;
  static const String accessToken = 'accesstoken';
  static const String userType = 'userType';
  static const String caseId = 'caseId';
  static const String notesId = 'notesId';
  static const String fileId = 'fileId';
  static const String s3Url = 's3Url';
  static const String downloadUrl = 'downloadUrl';
  static const String fileKey = 'fileKey';
  static const String fileName = 'fileName';
  static const String fileSize = 'fileSize';
  static const String phone = 'phone';
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

  static const String clid = 'clid';
  static const String checklistid = 'checklistid';
  static const String response = 'response';

  static const String createfirstName = 'firstName';
  static const String createlastName = 'lastName';
  static const String createEmail = 'createEmail';
  static const String createPhone = 'createPhone';
  static const String createAddress = 'createAddress';
  static const String createDateOfBirth = 'createDateOfBirth';
  static const String createGender = 'createGender';

  static Future<SharedPreferences> init() async {
    preferences = await SharedPreferences.getInstance();
    return preferences;
  }

  ///Method that saves the [response].
  static Future<bool> setResponse(String value) async =>
      preferences.setString(response, value);

  ///Method that returns the [response].
  static String getResponse() => preferences.getString(response) ?? '';

  ///Method that saves the [downloadUrl].
  static Future<bool> setDownloadUrl(String value) async =>
      preferences.setString(downloadUrl, value);

  ///Method that returns the [downloadUrl].
  static String getDownloadUrl() => preferences.getString(downloadUrl) ?? '';

  ///Method that saves the [clid].
  static Future<bool> setclid(String value) async =>
      preferences.setString(clid, value);

  ///Method that returns the [clid].
  static String getclid() => preferences.getString(clid) ?? '';

  ///Method that saves the [checklistid].
  static Future<bool> setchecklistid(String value) async =>
      preferences.setString(checklistid, value);

  ///Method that returns the [checklistid].
  static String getchecklistid() => preferences.getString(checklistid) ?? '';

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

  ///Method that saves the [phone].
  static Future<bool> setPhone(String value) async =>
      preferences.setString(phone, value);

  ///Method that returns the [phone].
  static String getPhone() => preferences.getString(phone) ?? '';

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

  ///Method that saves the [fileName].
  static Future<bool> setfileName(String value) async =>
      preferences.setString(fileName, value);

  ///Method that returns the [fileName].
  static String getfileName() => preferences.getString(fileName) ?? '';

  ///Method that saves the [fileSize].
  static Future<bool> setfileSize(int value) async =>
      preferences.setInt(fileSize, value);

  ///Method that returns the [fileSize].
  static int getfileSize() => preferences.getInt(fileSize) ?? 0;

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

  ///Method that saves the [createfirstName].
  static Future<bool> setfirstName(String value) async =>
      preferences.setString(createfirstName, value);

  ///Method that returns the [createfirstName].
  static String getFirstName() => preferences.getString(createfirstName) ?? '';

  ///Method that saves the [createlastName].
  static Future<bool> setlastName(String value) async =>
      preferences.setString(createlastName, value);

  ///Method that returns the [createlastName].
  static String getlastName() => preferences.getString(createlastName) ?? '';

  ///Method that saves the [createEmail].
  static Future<bool> setEmail(String value) async =>
      preferences.setString(createEmail, value);

  ///Method that returns the [createEmail].
  static String getEmail() => preferences.getString(createEmail) ?? '';

  ///Method that saves the [createPhone].
  static Future<bool> setcreatePhone(String value) async =>
      preferences.setString(createPhone, value);

  ///Method that returns the [createPhone].
  static String getcreatePhone() => preferences.getString(createPhone) ?? '';

  ///Method that saves the [createAddress].
  static Future<bool> setAddress(String value) async =>
      preferences.setString(createAddress, value);

  ///Method that returns the [createAddress].
  static String getAddress() => preferences.getString(createAddress) ?? '';

  ///Method that saves the [createDateOfBirth].
  static Future<bool> setDateOfBirth(String value) async =>
      preferences.setString(createDateOfBirth, value);

  ///Method that returns the [createDateOfBirth].
  static String getDateOfBirth() =>
      preferences.getString(createDateOfBirth) ?? '';

  ///Method that saves the [createGender].
  static Future<bool> setGender(String value) async =>
      preferences.setString(createGender, value);

  ///Method that returns the [createGender].
  static String getGender() => preferences.getString(createGender) ?? '';

  static Future<bool> setDataList(List<Map<String, String>> dataList) async {
    String jsonString = jsonEncode(dataList);
    return preferences.setString(dataListKey, jsonString);
  }

  static List<Map<String, String>> getDataList() {
    String? jsonString = preferences.getString(dataListKey);
    if (jsonString != null) {
      List<dynamic> jsonList = jsonDecode(jsonString);
      return jsonList.map((e) => Map<String, String>.from(e)).toList();
    }
    return [];
  }

  static Future<bool> remove(String key) async => await preferences.remove(key);

  static Future<bool> clear() async => await preferences.clear();
}

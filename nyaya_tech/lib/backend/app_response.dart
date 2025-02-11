import 'package:nyaya_tech/backend/custom_response.dart';

class AppResponse {
  final CustomResponse response;
  AppResponse({required this.response});

  get statusCode => response.statusCode;

  get message => response.data!.message.toString();

  get error => response.data!.message.toString();

  get errors => response.data!.errors;
}
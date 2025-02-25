import 'package:nyaya_tech/flutter_flow/flutter_flow_util.dart';

const String scheme = "https";
// const String host = "dev-api-nyayatech.workr.in";
const String host = "v2-dev-api-nyayatech.workr.in";
const String version = 'v1.0';

String buildUrl(String path, {Map<String, dynamic>? queryParams}) {
  if (queryParams != null) {
    queryParams.removeWhere((key, value) => value == null || value == '');
  }
  path = path.replaceAll(RegExp('^/+'), '');
  var uri = Uri(
    scheme: scheme,
    host: host,
    path: '$version/$path',
    queryParameters: queryParams,
  );
  return uri.toString();
}

dynamic successMessage({required dynamic jsonBody}) => getJsonField(
      jsonBody,
      r'''$.message''',
    );

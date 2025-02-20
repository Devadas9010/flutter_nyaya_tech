import 'package:collection/collection.dart';

class FormErrorHelper {
  final Map<dynamic, dynamic>? errors;

  FormErrorHelper({this.errors});

  get hasErrors => errors != null;

  bool hasError(String key) =>
      hasErrors ? errors!.containsKey(key) : false;

  String? message(String key) {
    if (hasError(key)) {
      dynamic errorElement = errors!
          .entries
          .firstWhereOrNull((element) => element.key == key);
      if (errorElement != null) {
        return errorElement!.value;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }
}

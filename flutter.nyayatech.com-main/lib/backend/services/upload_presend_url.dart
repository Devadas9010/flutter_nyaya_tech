import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class UploadAttachmentsApi {
  Future<http.Response> call({required XFile file, required String url}) async {  
    url = url.replaceAll(' ', '_');

    return await http.put(
      Uri.parse(url),
      body: await file.readAsBytes(),
    );
  }
}

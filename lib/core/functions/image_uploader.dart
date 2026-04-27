import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;

Future<String?> uploadImageToCloudinary(File imageFile) async {
  if (!await imageFile.exists()) {
    log('File does not exist: ${imageFile.path}');
    return null;
  }

  String cloudName = 'dk1vdvjbk';

  final url = Uri.parse(
    'https://api.cloudinary.com/v1_1/$cloudName/image/upload',
  );

  final request = http.MultipartRequest('POST', url);
  request.fields['upload_preset'] = "se7ety";
  request.files.add(await http.MultipartFile.fromPath('file', imageFile.path));

  try {
    final response = await request.send();
    final responseBody = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      final responseData = json.decode(responseBody);
      log('responseData: $responseData');
      return responseData['secure_url'];
    } else {
      log('Failed to upload image. Status code: ${response.statusCode}');
      log('Error response: $responseBody');
      return null;
    }
  } catch (e) {
    log('Error uploading image: $e');
    return null;
  }
}

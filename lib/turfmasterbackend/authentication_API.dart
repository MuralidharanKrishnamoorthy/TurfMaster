import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';

const String baseUrl = 'http://192.168.1.8:8000/api/admin/';

Future<Map<String, dynamic>> register(
    String ownerName, String contactNumber, String createPassword) async {
  return await _postRequest(
    'register',
    body: {
      'OwnerName': ownerName,
      'ContactNumber': contactNumber,
      'CreatePassword': createPassword,
    },
  );
}

Future<Map<String, dynamic>> login(
    String contactNumber, String createPassword) async {
  return await _postRequest(
    'login',
    body: {
      'ContactNumber': contactNumber,
      'CreatePassword': createPassword,
    },
  );
}

Future<Map<String, dynamic>> uploadDetails({
  required String token,
  required String turfName,
  required String location,
  required List<File> images,
  required List<String> slots,
  required String description,
  required String price,
}) async {
  final url = Uri.parse(baseUrl + 'api/admin/add');
  final request = http.MultipartRequest('POST', url)
    ..headers['auth-token'] = token
    ..fields['turfName'] = turfName
    ..fields['location'] = location
    ..fields['slots'] = jsonEncode(slots)
    ..fields['description'] = description
    ..fields['price'] = price;

  for (var image in images) {
    request.files.add(await http.MultipartFile.fromPath('images', image.path));
  }

  final streamResponse = await request.send();
  final response = await http.Response.fromStream(streamResponse);

  if (response.statusCode >= 200 && response.statusCode < 300) {
    return jsonDecode(response.body);
  } else {
    _handleError(response);
    return {};
  }
}

Future<Map<String, dynamic>> _postRequest(String endpoint,
    {Map<String, dynamic>? body, String? token}) async {
  final url = Uri.parse(baseUrl + endpoint);
  final headers = {
    'Content-Type': 'application/json',
    if (token != null) 'auth-token': token,
  };

  final response = await http.post(
    url,
    body: jsonEncode(body),
    headers: headers,
  );

  if (response.statusCode >= 200 && response.statusCode < 300) {
    return jsonDecode(response.body);
  } else {
    _handleError(response);
    return {};
  }
}

void _handleError(http.Response response) {
  String errorMessage;
  try {
    final decodedResponse = jsonDecode(response.body);
    errorMessage = decodedResponse['message'] ?? 'Unknown error occurred';
  } catch (e) {
    errorMessage =
        response.body.isNotEmpty ? response.body : 'Unknown error occurred';
  }
  throw Exception(errorMessage);
}

import 'dart:convert';
import 'package:http/http.dart' as http;

const String baseUrl = 'http://192.168.1.8:8000/api/admin/';

Future<Map<String, dynamic>> register(String ownerName, String contactNumber, String createPassword) async {
  return await _postRequest(
    'register',
    body: {
      'OwnerName': ownerName,
      'ContactNumber': contactNumber,
      'CreatePassword': createPassword,
    },
  );
}

Future<Map<String, dynamic>> login(String contactNumber, String createPassword) async {
  return await _postRequest(
    'login',
    body: {
      'ContactNumber': contactNumber,
      'CreatePassword': createPassword,
    },
  );
}

Future<Map<String, dynamic>> addTurfDetails(String token, Map<String, dynamic> turfData) async {
  return await _postRequest(
    'admindashboard/details',
    body: turfData,
    token: token,
  );
}

Future<Map<String, dynamic>> uploadImage(String token, String filePath) async {
  final url = Uri.parse(baseUrl + 'admin/image/upload');
  final request = http.MultipartRequest('POST', url)
    ..headers['auth-token'] = token
    ..files.add(await http.MultipartFile.fromPath('file', filePath));

  final streamResponse = await request.send();
  final response = await http.Response.fromStream(streamResponse);

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    _handleError(response);
    return {

    };
  }
}

Future<Map<String, dynamic>> _postRequest(String endpoint, {Map<String, dynamic>? body, String? token}) async {
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
  throw Exception('Failed with status code ${response.statusCode}: ${response.body}');
}

import 'dart:convert';
import 'package:http/http.dart' as http;


const String baseUrl = 'http://localhost:3000/api/admin/';

Future<Map<String, dynamic>> register(String ownerName, String contactNumber, String createPassword) async {
  final url = Uri.parse(baseUrl + 'register');
  final response = await http.post(
    url,
    body: jsonEncode({
      'OwnerName': ownerName,
      'ContactNumber': contactNumber,
      'CreatePassword': createPassword,
    }),
    headers: {
      'Content-Type': 'application/json',
    },
  );

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to register user');
  }
}

Future<Map<String, dynamic>> login(String ownerName, String createPassword) async {
  final url = Uri.parse(baseUrl + 'login');
  final response = await http.post(
    url,
    body: jsonEncode({
      'OwnerName': ownerName,
      'CreatePassword': createPassword,
    }),
    headers: {
      'Content-Type': 'application/json',
    },
  );

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to login');
  }
}

Future<Map<String, dynamic>> addTurfDetails(String token, Map<String, dynamic> turfData) async {
  final url = Uri.parse(baseUrl + 'admindashboard/details');
  final response = await http.post(
    url,
    body: jsonEncode(turfData),
    headers: {
      'Content-Type': 'application/json',
      'auth-token': token,
    },
  );

  if (response.statusCode == 201) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to add turf details');
  }
}

Future<Map<String, dynamic>> uploadImage(String token, String filePath) async {
  final url = Uri.parse(baseUrl + 'admin/image/upload');
  final request = http.MultipartRequest('POST', url)
    ..headers['auth-token'] = token
    ..files.add(await http.MultipartFile.fromPath('file', filePath));

  final response = await http.Response.fromStream(await request.send());

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to upload image');
  }
}

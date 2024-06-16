import 'package:http/http.dart'as http;
import 'dart:convert';
class authentication_API{
     final String loginurl;
     final String registerurl;
     authentication_API({required this.loginurl,
     required this.registerurl}) {

     }
     Future<Map<String , dynamic>> login(String Username , String Password) async {
       final response = await http.post(
         Uri.parse("http://localhost:3000/api/user/login"),
         headers: <String,String>{
           'Content-Type':'application/json; charset=UTF=8',
     },
     body:jsonEncode(<String , String>{
        'Username':Username,
        'Password':Password,

     }),
     );
       if(response.statusCode == 200){
         return jsonDecode(response.body);
     }
       else {
         throw Exception('Login Failed');
     }
  }
  Future <Map<String, dynamic>> register(String Username , String Email , String MobileNumber , String Password , String ConfirmPassword) async{
       final response = await http.post(
         Uri.parse('http://localhost:3000/api/user/register'),
         headers: <String, String>{
           'Content-Type':'application/json; charset=UTF=8',
         },
         body: jsonEncode(<String,String>{
           'Username':Username,
           'Email':Email,
       'MobileNumber':MobileNumber,
       'Password':'Password',
       'ConfirmPassword':'ConfirmPassword'
       }),

       );
       if(response.statusCode==200){
         return jsonDecode(response.body);
       }
       else{
         throw Exception('Registeration Failed');
       }
  }

}
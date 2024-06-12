import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:turfbooking/colors/colors.dart';
import 'package:turfbooking/pages-users/userregister.dart';
class Userlogin extends StatefulWidget {
  const Userlogin({super.key});

  @override
  State<Userlogin> createState() => UserloginState();
}

class UserloginState extends State<Userlogin> {
  final _usernamecontroller= TextEditingController();
  final _passwordeditingcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(20),
        child: AppBar(
          backgroundColor: entireapp,
          automaticallyImplyLeading: false,
        ),
      ),
      backgroundColor: white,
      body: Padding(padding: EdgeInsets.only(top: 100),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:<Widget>
            [
              Container(
                child: Image(image: AssetImage('images/login.png',),
                  height: 150,),
              ),
              Container(
              padding: EdgeInsets.only(top: 30,left: 30),
              child: Text('Login',
              style: GoogleFonts.poppins(fontWeight: FontWeight.w600, color: entireapp,fontSize:30 ,),
              ),
            ),
              Container(
                child: Padding(padding: EdgeInsets.only(left: 30,right: 30,top: 10),
                  child: TextField(
                    keyboardType:TextInputType.text ,
                    controller: _usernamecontroller,
                    cursorColor: linkColor,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person_2_outlined,color: entireapp,),
                      labelText: 'Username',
                      labelStyle: GoogleFonts.poppins(color: black,fontSize: 15),
                      hintText: 'enter username',
                      fillColor: scaffold,
                      filled: true,
                      hintStyle: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w300),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: entireapp,width: 2)
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: entireapp, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: entireapp, width: 2),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.red, width: 2),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.red, width: 2),
                      ),
                    ),
          
                  ),
                ),
              ),
              Container(
                child: Padding(padding: EdgeInsets.only(left: 30,right: 30,top: 10),
                  child: TextField(
                    cursorColor: linkColor,
                    maxLines: 1,
                    obscureText: true,
                    obscuringCharacter: '*',
                    keyboardType:TextInputType.visiblePassword ,
                    controller: _passwordeditingcontroller,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.password_outlined,color: entireapp,),
                      labelText: 'password',
                      labelStyle: GoogleFonts.poppins(color: black,fontSize: 15),
                      hintText: 'enter password',
                      fillColor: scaffold,
                      filled: true,
                      hintStyle: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w300),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: entireapp,width: 2)
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: entireapp, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: entireapp, width: 2),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.red, width: 2),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.red, width: 2),
                      ),
                    ),
          
                  ),
                ),
          
              ),
              SizedBox(width: 30,height: 60,
                child: Container(
                  child: Padding(padding: EdgeInsets.only(left: 20,right: 20,top: 8),
                    child: ElevatedButton(

                      onPressed: (){},
                      child: Text('Login',
                      style: GoogleFonts.poppins(fontSize: 20,color: white),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: entireapp,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),

                        )
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    child: Text('New User?', style: GoogleFonts.inter(fontSize: 15,color: black),)
                  ),
                  Container(
                    child: TextButton(
          
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>userregister()));
                      },
                      child: Text('Register',
                        style: GoogleFonts.inter(fontSize: 15,color: entireapp,fontWeight: FontWeight.w700),),
                    ),
                  ),
                ],
          
              )
            ]
          ),
        ),
      ),


    );
  }
}


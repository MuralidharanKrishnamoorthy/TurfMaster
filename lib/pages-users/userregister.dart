import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:turfbooking/colors/colors.dart';
class userregister extends StatefulWidget {
  const userregister({super.key});

  @override
  State<userregister> createState() => _userregisterState();
}

class _userregisterState extends State<userregister> {
  final _emaileditingcontroller = TextEditingController();
  final _passwordeditingcontroller= TextEditingController();
  final _confirmpasswordeditingcontroller= TextEditingController();
  final _usernamecontroller= TextEditingController();
  final _numbercontroller= TextEditingController();
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
      body: Padding(padding: EdgeInsets.only(top: 50),
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
                  padding: EdgeInsets.only(top: 10,left: 30),
                  child: Text('Register',
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w600, color: entireapp,fontSize:30 ,),
                  ),
                ),
                Container(
                  child: Padding(padding: EdgeInsets.only(left: 30,right: 30,top: 10),
                    child: TextField(
                      keyboardType:TextInputType.name ,
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
                      keyboardType:TextInputType.emailAddress,
                      controller: _emaileditingcontroller,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email_outlined,color: entireapp,),
                        labelText: 'Email',
                        labelStyle: GoogleFonts.poppins(color: black,fontSize: 15),
                        hintText: 'enter email',
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
                      maxLength: 10,
                      keyboardType:TextInputType.number ,
                      controller: _numbercontroller,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.dialpad,color: entireapp,),
                        labelText: 'Mobile Number',
                        labelStyle: GoogleFonts.poppins(color: black,fontSize: 15),
                        hintText: 'enter mobile number',
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
                      keyboardType:TextInputType.visiblePassword ,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(8)
                      ],
                      obscuringCharacter: '*',
                      obscureText: true,
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
                Container(
                  child: Padding(padding: EdgeInsets.only(left: 30,right: 30,top: 10),
                    child: TextField(
                      cursorColor: linkColor,
                      obscureText: true,
                      obscuringCharacter: '*',
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(8)
                      ],
                      keyboardType:TextInputType.visiblePassword ,
                      controller: _confirmpasswordeditingcontroller,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.password_outlined,color: entireapp,),
                        labelText: ' Confirm Password',
                        labelStyle: GoogleFonts.poppins(color: black,fontSize: 15),
                        hintText: 'enter confirm password',
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
                  child: Padding(padding: EdgeInsets.only(left: 10,right: 10,top: 8),
                    child: Container(
                      child: Padding(padding: EdgeInsets.only(left: 20,right: 20),
                        child: ElevatedButton(
                          onPressed: (){},
                          child: Text('Register',
                            style: GoogleFonts.poppins(fontSize: 20,color: white),),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: entireapp,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),

                              )
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
          
              ]
          ),
        ),
      ),


    );
  }
}




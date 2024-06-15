import"package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:google_fonts/google_fonts.dart";
import "package:turfbooking/colors/colors.dart";
import 'package:otp_text_field/otp_field.dart';
import "package:turfbooking/pages-admin/admindashboard.dart";
class adminregister extends StatefulWidget {
  const adminregister({super.key});

  @override
  State<adminregister> createState() => _adminregisterState();
}

class _adminregisterState extends State<adminregister> {
  @override
  Widget build(BuildContext context) {
    final _turfnamecontroller= TextEditingController();
    final _turflocationcontroller=TextEditingController();
    final _turfownernamecontroller=TextEditingController();
    final _turfcontactnumbercontoller=TextEditingController();
    final _createpasswordcontroller=TextEditingController();
    final _otpcontroller = TextEditingController();
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
                      controller: _turfnamecontroller,
                      cursorColor: linkColor,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.sports,color: entireapp,),
                        labelText: 'TurfName',
                        labelStyle: GoogleFonts.poppins(color: black,fontSize: 15),
                        hintText: 'enter turf name',
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
                      keyboardType:TextInputType.streetAddress,
                      controller: _turflocationcontroller,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.location_on_sharp,color: entireapp,),
                        labelText: 'Turf Location',
                        labelStyle: GoogleFonts.poppins(color: black,fontSize: 15),
                        hintText: 'enter turf location',
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
                      keyboardType:TextInputType.name ,
                      controller: _turfownernamecontroller,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person_2_outlined,color: entireapp,),
                        labelText: 'Owner Name',
                        labelStyle: GoogleFonts.poppins(color: black,fontSize: 15),
                        hintText: 'enter owner name',
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
                      keyboardType:TextInputType.number ,
                      controller: _turfcontactnumbercontoller,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone,color: entireapp,),
                        labelText: 'Contact Number',
                        labelStyle: GoogleFonts.poppins(color: black,fontSize: 15),
                        hintText: 'enter contact number',
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
                        LengthLimitingTextInputFormatter(10)
                      ],
                      keyboardType:TextInputType.visiblePassword ,
                      controller: _createpasswordcontroller,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.password_outlined,color: entireapp,),
                        labelText: ' Create Password',
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
                  child: Padding(padding: EdgeInsets.only(left: 10,right: 10,top: 8),
                    child: Container(
                      child: Padding(padding: EdgeInsets.only(left: 20,right: 20),
                        child: ElevatedButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>admindashboard()));
                          },
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

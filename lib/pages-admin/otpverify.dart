import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:turfbooking/colors/colors.dart';

class OTP_verify extends StatefulWidget {
  const OTP_verify({super.key});

  @override
  State<OTP_verify> createState() => _OTP_verifyState();
}

class _OTP_verifyState extends State<OTP_verify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(20),
        child: AppBar(
          backgroundColor: entireapp,
          automaticallyImplyLeading: false,
        ),
      ),
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 50),
              child: Container(
                child: Image(
                  image: AssetImage('images/EnterOTP.png'),
                  width: 180,
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.only(right: 170, top: 10),
                child: Text(
                  'Enter OTP',
                  style: GoogleFonts.niramit(
                      fontSize: 20, fontWeight: FontWeight.bold, color: black),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.only(right: 170, top: 10),
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'Enter the verification code sent to your mobile number ',
                    style:
                        GoogleFonts.poppins(fontSize: 12, color: admindashtext),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Container(
                child: Padding(
                  padding: EdgeInsets.only(left: 30, right: 30, top: 10),
                  child: OTPTextField(
                    length: 5,
                    width: MediaQuery.of(context).size.width,
                    fieldWidth: 40,
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: black,
                    ),
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldStyle: FieldStyle.box,
                    otpFieldStyle: OtpFieldStyle(
                      backgroundColor: scaffold,
                      borderColor: entireapp,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 20),
              child: Container(
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Submit',
                      style: GoogleFonts.poppins(fontSize: 20, color: white),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: entireapp,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        )),
                  ),
                ),
              ),
            ),
            Container(
              child: TextButton(
                onPressed: () {},
                child: Text('Resend verification code',
                    style: GoogleFonts.poppins(
                      color: entireapp,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:turfbooking/colors/colors.dart";
import "package:turfbooking/pages-admin/admindashboard.dart";
import "package:turfbooking/pages-admin/adminregister.dart";
import "package:turfbooking/turfmasterbackend/authentication_API.dart";

class adminlogin extends StatefulWidget {
  const adminlogin({super.key});

  @override
  State<adminlogin> createState() => _adminloginState();
}

class _adminloginState extends State<adminlogin> {
  @override
  Widget build(BuildContext context) {
    final _adminnamecontoller = TextEditingController();
    final _adminpasswordcontroller = TextEditingController();

    Future<void> loginuser() async {
      try {
        if (_adminnamecontoller.text.isEmpty &&
            _adminpasswordcontroller.text.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Enter all the details'),
            backgroundColor: errorcolor,
          ));
          return;
        }
        if (_adminnamecontoller.text.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Enter owner name'),
            backgroundColor: errorcolor,
          ));
          return;
        }

        if (_adminpasswordcontroller.text.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Enter Password'),
            backgroundColor: errorcolor,
          ));
          return;
        }
        final response = await login(
            _adminnamecontoller.text, _adminpasswordcontroller.text);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Successfully logged in',
              style: GoogleFonts.poppins(color: entireapp)),
          backgroundColor: Colors.transparent,
          behavior: SnackBarBehavior.floating,
          elevation: 0,
        ));
        Navigator.of(context).pushReplacementNamed('/home');
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Failed to login :$error'),
          backgroundColor: errorcolor,
        ));
      }
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(20),
        child: AppBar(
          backgroundColor: entireapp,
          automaticallyImplyLeading: false,
        ),
      ),
      backgroundColor: white,
      body: Padding(
        padding: EdgeInsets.only(top: 100),
        child: SingleChildScrollView(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  child: Image(
                    image: AssetImage(
                      'images/login.png',
                    ),
                    height: 150,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 30, left: 30),
                  child: Text(
                    'Login',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      color: entireapp,
                      fontSize: 30,
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.only(left: 30, right: 30, top: 10),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: _adminnamecontoller,
                      cursorColor: linkColor,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person_2_outlined,
                          color: entireapp,
                        ),
                        labelText: 'Contact Number',
                        labelStyle:
                            GoogleFonts.poppins(color: black, fontSize: 15),
                        hintText: 'enter contact number',
                        fillColor: scaffold,
                        filled: true,
                        hintStyle: GoogleFonts.poppins(
                            fontSize: 15, fontWeight: FontWeight.w300),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: entireapp, width: 2)),
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
                  child: Padding(
                    padding: EdgeInsets.only(left: 30, right: 30, top: 10),
                    child: TextField(
                      cursorColor: linkColor,
                      maxLines: 1,
                      obscureText: true,
                      obscuringCharacter: '.',
                      keyboardType: TextInputType.visiblePassword,
                      controller: _adminpasswordcontroller,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.password_outlined,
                          color: entireapp,
                        ),
                        labelText: 'password',
                        labelStyle:
                            GoogleFonts.poppins(color: black, fontSize: 15),
                        hintText: 'enter password',
                        fillColor: scaffold,
                        filled: true,
                        hintStyle: GoogleFonts.poppins(
                            fontSize: 15, fontWeight: FontWeight.w300),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: entireapp, width: 2)),
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
                SizedBox(
                  width: 30,
                  height: 60,
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 8),
                      child: ElevatedButton(
                        onPressed: loginuser,

                        child: Text(
                          'Login',
                          style:
                              GoogleFonts.poppins(fontSize: 20, color: white),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: entireapp,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            )),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => adminregister()));
                        },
                        child: Text(
                          'Register your Turf',
                          style: GoogleFonts.inter(
                              fontSize: 15,
                              color: entireapp,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ],
                )
              ]),
        ),
      ),
    );
  }
}

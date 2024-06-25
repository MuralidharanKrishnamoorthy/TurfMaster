import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:turfbooking/colors/colors.dart';


class admin_notification extends StatefulWidget {
  const admin_notification({super.key});

  @override
  State<admin_notification> createState() => _admin_notificationState();
}

class _admin_notificationState extends State<admin_notification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(20),
        child: AppBar(
          backgroundColor: entireapp,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                  icon: Icon(Icons.arrow_back_ios_sharp),
                  color: black,
                ),
                Image(
                  image: AssetImage('images/Turfbookinglogo.png'),
                  width: 35,
                  height: 35,
                )
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 150, top: 15),
                  child: Text(
                    'Notifications',
                    style: GoogleFonts.niramit(
                      color: admindashtext,
                      fontWeight: FontWeight.w500,
                      fontSize: 25,
                    ),
                  ),
                ),
              ],
            ),
            // Existing loop for notification entries
            for (int i = 1; i <= 3; i++)
              Container(
                width: 400,
                height: 250,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Card(
                    shadowColor: shadowColor,
                    elevation: 2,
                    color: card,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(right: 140,top: 5),
                              child: Text(
                                'XXXXX',
                                style: GoogleFonts.niramit(
                                  fontWeight: FontWeight.w400,
                                  color: black,
                                ),
                              ),
                            ),
                            Text(
                              '9234756***',
                              style: GoogleFonts.niramit(
                                fontWeight: FontWeight.w400,
                                color: admindashtext,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),

                        Padding(padding: EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.all(8),

                                  child: Text(
                                    'Date',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.niramit(color: admindashtext,fontWeight: FontWeight.w500,fontSize: 15)
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.all(8),

                                  child: Text(
                                    'Slot',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.niramit(color: admindashtext,fontWeight: FontWeight.w500,fontSize: 15)
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.all(8),

                                  child: Text(
                                    'Paid',
                                    textAlign: TextAlign.center,
                                    style:GoogleFonts.niramit(color: admindashtext,fontWeight: FontWeight.w500,fontSize: 15)
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 20,top: 50),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(

                                  child: Text('Requesting Slot',style: GoogleFonts.poppins(color: admindashtext,fontSize: 15,fontWeight: FontWeight.w600),),
                                ),

                              ),Container(
                                child: Padding(padding: EdgeInsets.only(right: 50),
                                  child: ElevatedButton(

                                    onPressed: (){

                                    },
                                    child: Text('Confirm',style: GoogleFonts.poppins(color: white,fontSize: 15),),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: entireapp,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4)
                                      )
                                    ),

                                  ),
                                ),
                              )

                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

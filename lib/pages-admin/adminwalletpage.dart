import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:turfbooking/colors/colors.dart';

class adminwallet extends StatefulWidget {
  const adminwallet({super.key});

  @override
  State<adminwallet> createState() => _adminwalletState();
}

class _adminwalletState extends State<adminwallet> {
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
                  padding: EdgeInsets.only(right: 200, top: 15),
                  child: Text(
                    'Wallet',
                    style: GoogleFonts.niramit(
                      color: admindashtext,
                      fontWeight: FontWeight.w500,
                      fontSize: 25,
                    ),
                  ),
                ),

                Container(
                  width: 400,
                  height: 238,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: Card(
                      elevation: 2,
                      color: card,
                      shadowColor: shadowColor,
                      child: Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Column(
                          children: <Widget>[
                            Icon(
                              Icons.account_balance_wallet,
                              size: 70,
                              color: entireapp,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 60),
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  'Withdraw',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                      color: white),
                                ),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: entireapp,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(2))),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                Container(
                  child: Padding(
                    padding: EdgeInsets.only(right: 130, top: 10),
                    child: Text(
                      'Recent Bookings',
                      style: GoogleFonts.niramit(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: admindashtext),
                    ),
                  ),
                ),
                for(int i=1;i<=3;i++)
                Container(
                  width: 400,
                  height: 200,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 20),
                    child: Card(
                      elevation: 2,
                      shadowColor: shadowColor,
                      color: card,
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(right: 140, top: 35),
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
                          Padding(
                            padding: EdgeInsets.only(top: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    child: Text('Date',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.niramit(
                                            color: admindashtext,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15)),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    child: Text('Slot',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.niramit(
                                            color: admindashtext,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15)),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    child: Text('Paid',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.niramit(
                                            color: admindashtext,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

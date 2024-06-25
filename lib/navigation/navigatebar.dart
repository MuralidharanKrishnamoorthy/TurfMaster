import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:turfbooking/colors/colors.dart';
import 'package:turfbooking/pages-admin/admindashboard.dart';
import 'package:turfbooking/pages-admin/adminnotification.dart';
import 'package:turfbooking/pages-admin/adminwalletpage.dart';

class navigatebar extends StatefulWidget {
  const navigatebar({super.key});

  @override
  State<navigatebar> createState() => _navigatebarState();
}

class _navigatebarState extends State<navigatebar> {
  int currentindex = 0;
  final PageController pageController = PageController();
  final List<Widget> pages = [
    admindashboard(),
    admin_notification(),
    adminwallet()
  ];
  void onitemtapped(int index) {
    setState(() {
      currentindex = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: pages,
        onPageChanged: (index) {
          setState(() {
            currentindex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: scaffold,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications,),
              label: "Notification"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet),
              label: "Wallet"),
        ],
        currentIndex: currentindex,
        selectedItemColor: entireapp,
        unselectedItemColor: navigationbar,
        selectedLabelStyle: GoogleFonts.niramit(fontSize: 15,fontWeight: FontWeight.w700),
        showSelectedLabels: true,
        showUnselectedLabels: false,
        onTap: onitemtapped,
        iconSize: 30,

      ),
    );
  }
}

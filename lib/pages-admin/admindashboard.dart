import 'package:flutter/material.dart';
import 'package:turfbooking/colors/colors.dart';
class admindashboard extends StatefulWidget {
  const admindashboard({super.key});

  @override
  State<admindashboard> createState() => _admindashboardState();
}

class _admindashboardState extends State<admindashboard> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: PreferredSize(preferredSize: Size.fromHeight(20),
       child: AppBar(
         backgroundColor: entireapp,

       ),

     ),
     body: Column(
       children: [
         Container(
           child: Card(
             elevation: 20,

           ),
         )
       ],
     ),
   );
  }
}

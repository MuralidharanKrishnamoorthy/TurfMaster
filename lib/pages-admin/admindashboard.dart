import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:turfbooking/colors/colors.dart';
class admindashboard extends StatefulWidget {
  const admindashboard({super.key});

  @override
  State<admindashboard> createState() => _admindashboardState();
}

class _admindashboardState extends State<admindashboard> {
  final _timecontroller = TextEditingController();
  final _Turfdetailcontroller= TextEditingController();
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: white,
     appBar: PreferredSize(preferredSize: Size.fromHeight(20),
       child: AppBar(
         automaticallyImplyLeading: false,
         backgroundColor: entireapp,

       ),

     ),
     body: Padding(padding: EdgeInsets.only(top: 40,left: 10,right: 10),
       child: SingleChildScrollView(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           crossAxisAlignment: CrossAxisAlignment.stretch,
           mainAxisSize: MainAxisSize.min,
         
           children:<Widget>
           [
             Container(
               margin: EdgeInsets.only(left: 8),
               child: Text('Add Images',
               style: GoogleFonts.niramit(fontSize: 20,
                 color: admindashtext
         
               ),
         
               ),
             ),
         
             Padding(padding: EdgeInsets.only(top: 5),
               child: Container(
               width: 400,
               height: 200,
               child: Card(
                 shadowColor: shadowColor,
                 elevation: 2,
                 color: card,
                 child:IconButton(
                     onPressed: (){
                       print('clicked');
                     },
                   iconSize: 40,
                     icon:Image.asset('images/addimage.png',
                     width: 50,
                       height: 50,
                     ),
                  // splashColor: white,
                   highlightColor: Colors.transparent,
                 ),
               ),
                        ),
             ),
             Container(
               margin: EdgeInsets.only(left: 8,top: 10),
               child: Text('Add Slots',
                 style: GoogleFonts.niramit(fontSize: 20,
                     color: admindashtext
                 ),
               ),
             ),
             Padding(padding: EdgeInsets.only(top: 5),
               child: Container(
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: <Widget>[
                     Expanded(
                       child: Padding(padding: EdgeInsets.only(right: 10,left: 5),
                         child: SizedBox(
                           height: 45,
                           child: TextField(
                             cursorColor: entireapp,
                             controller: _timecontroller,
                             decoration: InputDecoration(
                               hintText: 'Time',
                               prefixIcon: Icon(Icons.access_time_sharp,color: entireapp,),
                               hintStyle: GoogleFonts.poppins(color: admindashtext),
                               fillColor: scaffold,
                               filled: true,
                               enabledBorder: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(6),
                                 borderSide: BorderSide(color: entireapp, width: 2),
                               ),
                               focusedBorder: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(6),
                                 borderSide: BorderSide(color: entireapp, width: 2),
                               ),
                             ),
                           ),
                         ),
                       ),
                     ),
                     SizedBox(
                       height: 45,
                       child: Container(
                         child: ElevatedButton(
                           onPressed: (){

                           },
                           child: Text(' Add ',
                           style: GoogleFonts.poppins(color: white),
                           ),
                           style: ElevatedButton.styleFrom(
                             backgroundColor: entireapp,
                             shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(6)
                             )
                           ),
                         ),
                       ),
                     )
                   ],
                 ),
               ),
         
             ),
             Container(
               margin: EdgeInsets.only(left: 8,top: 10),
               child: Text(' Write about your Turf ',
                 style: GoogleFonts.niramit(fontSize: 20,
                     color: admindashtext
                 ),
               ),
             ),
             Padding(padding: EdgeInsets.only(top: 5),
               child: Container(
                 width: 400,
                 height: 200,
                 child: Card(
                   shadowColor: shadowColor,
                   elevation: 2,
                   color: card,
         
                   child: TextField(
                     controller: _Turfdetailcontroller,
                 keyboardType: TextInputType.multiline,
                     maxLength: 1000,
                     maxLines: null,
                     decoration: InputDecoration(
                       prefixIcon: Icon(Icons.edit,color: entireapp,),
                         enabledBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(6),
                     borderSide: BorderSide(color: Colors.transparent, width: 2),
                   ),
                   focusedBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(6),
                     borderSide: BorderSide(color: Colors.transparent, width: 2),
                   ),
                     ),

                   ),
                 ),
               ),
             ),
             Padding(padding: EdgeInsets.only(top: 5),
               child: Container(
                 margin: EdgeInsets.only(left: 253),
                 child: SizedBox(
                   height: 45,
                   child: ElevatedButton(
                     onPressed: (){},
                     child: Text(' Save ',
                     style: GoogleFonts.poppins(color: white),
                     ),
                     style: ElevatedButton.styleFrom(
                       backgroundColor: entireapp,
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(6)
                       )
                     ),
                   ),
                 ),
               ),
             )
         
         
         ]
         ),
       ),
     ),


   );
  }
}

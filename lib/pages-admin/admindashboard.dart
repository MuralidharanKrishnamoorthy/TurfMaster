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
  final _Turfdetailcontroller = TextEditingController();
  final _amountcontroller = TextEditingController();
  String _selectedPeriod = 'AM';
  List<String> slots = [];

  void _addSlot() {
    setState(() {
      if (_timecontroller.text.isNotEmpty) {
        slots.add('${_timecontroller.text} $_selectedPeriod');
        _timecontroller.clear();
        _selectedPeriod = 'AM';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(20),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: entireapp,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 40, left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 8),
                child: Text(
                  'Add Images',
                  style: GoogleFonts.niramit(fontSize: 20, color: admindashtext),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: Container(
                  width: 400,
                  height: 200,
                  child: Card(
                    shadowColor: shadowColor,
                    elevation: 2,
                    color: card,
                    child: IconButton(
                      onPressed: () {
                        print('clicked');
                      },
                      iconSize: 40,
                      icon: Image.asset(
                        'images/addimage.png',
                        width: 50,
                        height: 50,
                      ),
                      highlightColor: Colors.transparent,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 8, top: 10),
                child: Text(
                  'Add Slots',
                  style: GoogleFonts.niramit(fontSize: 20, color: admindashtext),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(right: 10, left: 5),
                          child: SizedBox(
                            height: 45,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              cursorColor: entireapp,
                              controller: _timecontroller,
                              decoration: InputDecoration(
                                hintText: 'Time',
                                prefixIcon: Icon(
                                  Icons.access_time_sharp,
                                  color: entireapp,
                                ),
                                hintStyle:
                                GoogleFonts.poppins(color: admindashtext),
                                fillColor: scaffold,
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide:
                                  BorderSide(color: entireapp, width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide:
                                  BorderSide(color: entireapp, width: 2),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 45,
                        child: Padding(padding: EdgeInsets.only(right: 6),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: scaffold,
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: entireapp, width: 2),
                            ),
                            child: DropdownButton<String>(
                              value: _selectedPeriod,
                              dropdownColor: scaffold,
                              icon: Icon(Icons.arrow_drop_down, color: entireapp),
                              underline: SizedBox(
                                height: 45,
                              ),
                              items: <String>['AM', 'PM']
                                  .map<DropdownMenuItem<String>>(
                                    (String value) => DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value,
                                      style: TextStyle(
                                          color: entireapp, fontSize: 16)),
                                ),
                              )
                                  .toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedPeriod = newValue!;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 45,
                        child: Container(
                          child: ElevatedButton(
                            onPressed: _addSlot,
                            child: Text(
                              ' Add ',
                              style: GoogleFonts.poppins(color: white),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: entireapp,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 8, top: 10),
                child: Text(
                  'Slots',
                  style: GoogleFonts.niramit(fontSize: 20, color: admindashtext),
                ),
              ),
              Wrap(
                spacing: 8.0,
                runSpacing: 4.0,
                children: slots.map((slot) {
                  return Chip(
                    label: Text(slot),
                    backgroundColor: scaffold,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                      side: BorderSide(color: entireapp, width: 2),
                    ),
                  );
                }).toList(),
              ),
              Container(
                margin: EdgeInsets.only(left: 8, top: 10),
                child: Text(
                  'Write about your Turf',
                  style: GoogleFonts.niramit(fontSize: 20, color: admindashtext),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5),
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
                        hintText: 'Type something',
                        hintStyle: GoogleFonts.niramit(color: admindashtext),
                        prefixIcon: Icon(
                          Icons.edit,
                          color: entireapp,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide:
                          BorderSide(color: Colors.transparent, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide:
                          BorderSide(color: Colors.transparent, width: 2),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, left: 5, right: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 45,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: _amountcontroller,
                          cursorColor: entireapp,
                          decoration: InputDecoration(
                            hintText: "Enter price per hour",
                            hintStyle: GoogleFonts.poppins(color: admindashtext),
                            prefixIcon: Icon(
                              Icons.currency_rupee,
                              color: entireapp,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide:
                              BorderSide(color: entireapp, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide:
                              BorderSide(color: entireapp, width: 2),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    SizedBox(
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () {
                          // Save slots and other data to the database here
                        },
                        child: Text(
                          ' Save ',
                          style: GoogleFonts.poppins(color: white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: entireapp,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 30),
                child: Container(

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

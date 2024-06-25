import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:turfbooking/colors/colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:convert';
import 'dart:io';



class admindashboard extends StatefulWidget {
  const admindashboard({super.key});

  @override
  State<admindashboard> createState() => _admindashboardState();
}

class _admindashboardState extends State<admindashboard> {
  bool isloading = false;
  final _timecontroller = TextEditingController();
  final _Turfdetailcontroller = TextEditingController();
  final _amountcontroller = TextEditingController();
  final _turfnamecontroller = TextEditingController();
  String _selectedPeriod = 'AM';
  List<String> slots = [];
  List<File> _images = [];
  String _location = 'Location not set';

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _images.add(File(pickedFile.path));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Please select an image'),
            backgroundColor: errorcolor,
          ),
        );
      }
    });
  }

  Future<void> _uploadData() async {
    String url = 'http://192.168.1.8:8000/turf/add';

    var request = http.MultipartRequest('POST', Uri.parse(url));

    request.fields['turfName'] = _turfnamecontroller.text;
    request.fields['location'] = _location;
    request.fields['slots'] = json.encode(slots);
    request.fields['description'] = _Turfdetailcontroller.text;
    request.fields['price'] = _amountcontroller.text;

    for (var image in _images) {
      request.files
          .add(await http.MultipartFile.fromPath('images', image.path));
    }

    var response = await request.send();

    if (response.statusCode == 201) {
      var responseData = await response.stream.bytesToString();
      var jsonResponse = json.decode(responseData);
      if (jsonResponse['success']) {
        print('Data uploaded successfully.');
        cleardetails();
      } else {
        print('Data upload failed: ${jsonResponse['error']}');
        cleardetails();
      }
    } else {
      print('Data upload failed with status code: ${response.statusCode}');
      cleardetails();
    }
  }

  void cleardetails() {
    setState(() {
      isloading = true;
      Future.delayed(Duration(seconds: 5), () {
        setState(() {
          _amountcontroller.clear();
          _timecontroller.clear();
          _turfnamecontroller.clear();
          _Turfdetailcontroller.clear();
          _selectedPeriod = "AM";
          slots.clear();
          _images.clear();
          _location = "Location not set";
          isloading = false;
        });
      });
    });
  }

  void _addSlot() {
    setState(() {
      if (_timecontroller.text.isNotEmpty) {
        slots.add('${_timecontroller.text} $_selectedPeriod');
        _timecontroller.clear();
        _selectedPeriod = 'AM';
      }
    });
  }

  Future<void> _getCurrentLocation() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placemarks[0];

      setState(() {
        _location =
            '${place.locality}, ${place.administrativeArea}, ${place.country}';
      });
    } else if (status.isDenied) {
      setState(() {
        _location = 'Location permission denied';
      });
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
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
                child: Padding(
                  padding: EdgeInsets.only(left: 5, right: 5, top: 10),
                  child: SizedBox(
                    height: 50,
                    child: TextField(
                      keyboardType: TextInputType.name,
                      controller: _turfnamecontroller,
                      cursorColor: linkColor,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.sports, color: entireapp),
                        labelText: 'TurfName',
                        labelStyle:
                            GoogleFonts.poppins(color: black, fontSize: 15),
                        hintText: 'Enter turf name',
                        fillColor: scaffold,
                        filled: true,
                        hintStyle: GoogleFonts.poppins(
                            fontSize: 15, fontWeight: FontWeight.w300),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: entireapp, width: 2),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: entireapp, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: entireapp, width: 2),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: errorcolor, width: 2),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: _pickImage,
                        child: Text(
                          'Upload Image',
                          style: GoogleFonts.poppins(color: white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: entireapp,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: _getCurrentLocation,
                        child: Text(
                          'Get Location',
                          style: GoogleFonts.poppins(color: white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: entireapp,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5, left: 8),
                child: Container(
                  child: Row(
                    children: [
                      Text(
                        'Location: ',
                        style:
                            GoogleFonts.poppins(fontSize: 15, color: entireapp),
                      ),
                      Text(
                        _location,
                        style: GoogleFonts.poppins(fontSize: 15, color: black),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5, left: 8, right: 8),
                child: Container(
                  child: Row(
                    children: _images.map((image) {
                      return Container(
                        margin: EdgeInsets.only(right: 5),
                        child: Image.file(
                          image,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 8, top: 10),
                child: Text(
                  'Slots',
                  style:
                      GoogleFonts.niramit(fontSize: 20, color: admindashtext),
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
              Padding(
                padding: EdgeInsets.only(top: 5, left: 8, right: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 45,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          cursorColor: linkColor,
                          controller: _timecontroller,
                          decoration: InputDecoration(
                            labelText: 'Slot Time',
                            labelStyle:
                                GoogleFonts.poppins(color: black, fontSize: 15),
                            fillColor: scaffold,
                            filled: true,
                            hintText: 'Enter slot time',
                            hintStyle: GoogleFonts.poppins(
                                color: admindashtext,
                                fontSize: 15,
                                fontWeight: FontWeight.w300),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide:
                                  BorderSide(color: entireapp, width: 2),
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
                    Container(
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: scaffold,
                        border: Border.all(color: entireapp, width: 2),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _selectedPeriod,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedPeriod = newValue!;
                            });
                          },
                          items: <String>['AM', 'PM']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(value,
                                    style: GoogleFonts.poppins(
                                        color: black, fontSize: 15)),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    SizedBox(
                      height: 45,
                      child: ElevatedButton(
                        onPressed: _addSlot,
                        child: Text('Add Slot',
                            style: GoogleFonts.poppins(color: white)),
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
              Container(
                margin: EdgeInsets.only(left: 8, top: 10),
                child: Text(
                  'Write about your Turf',
                  style:
                      GoogleFonts.niramit(fontSize: 20, color: admindashtext),
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
                      cursorColor: linkColor,
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
                          cursorColor: linkColor,
                          decoration: InputDecoration(
                            hintText: "Enter price per hour",
                            hintStyle:
                                GoogleFonts.poppins(color: admindashtext),
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
                          _uploadData();
                          cleardetails();
                        },
                        child: Text(
                          'Save',
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

            ],
          ),
        ),
      ),

    );
  }
}

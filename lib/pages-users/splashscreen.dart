import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart'; // Import the animated_text_kit package
import 'package:turfbooking/colors/colors.dart';
import 'package:turfbooking/pages-admin/adminlogin.dart';
import 'package:turfbooking/pages-admin/adminregister.dart';
import 'package:turfbooking/pages-users/userlogin.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _showSecondSequence = false;
  bool _showLoginAndButtons = false;

  void _onFirstSequenceComplete() {
    setState(() {
      _showSecondSequence = true;
    });
  }

  void _onTypewriterComplete() {
    setState(() {
      _showLoginAndButtons = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(20),
        child: AppBar(
          backgroundColor: entireapp,
        ),
      ),
      backgroundColor: white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: Container(
              width: _width * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image(
                    image: AssetImage('images/Turfbookinglogo.png'),
                    width: _width * 0.26,
                  ),
                  SizedBox(height: 10),
                  AnimatedTextSequence(
                    texts: ['Welcome to', 'TurfMaster'],
                    durations: [Duration(seconds: 1), Duration(seconds: 1)],
                    textStyles: [
                      GoogleFonts.poppins(fontSize: 38, fontWeight: FontWeight.bold, color: entireapp),
                      GoogleFonts.poppins(fontSize: 33, fontWeight: FontWeight.bold, color: entireapp),
                    ],
                    onComplete: _onFirstSequenceComplete,
                  ),
                  SizedBox(height: 10),
                  if (_showSecondSequence)
                    AnimatedTypewriterText(onComplete: _onTypewriterComplete),
                  SizedBox(height: 10),
                  AnimatedOpacity(
                    opacity: _showLoginAndButtons ? 1.0 : 0.0,
                    duration: Duration(milliseconds: 20),
                    child: Visibility(
                      visible: _showLoginAndButtons,
                      child: Column(
                        children: [
                          Container(
                            child: Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Log in to Get Started ! ',
                                    style: GoogleFonts.poppins(
                                      color: black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(left: 50,right: 60),
                              child: Divider(height: 10,color: entireapp,)),
                          Container(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Userlogin()));
                                    },
                                    child: Text(
                                      '  User  ',
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        color: scaffold,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: entireapp,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(2),
                                        )),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>adminlogin()));
                                    },
                                    child: Text(
                                      'Admin',
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        color: entireapp,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(2),
                                        side: BorderSide(color: buttonColor, width: 2),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class AnimatedTextSequence extends StatefulWidget {
  final List<String> texts;
  final List<Duration> durations;
  final List<TextStyle> textStyles;
  final VoidCallback? onComplete;

  const AnimatedTextSequence({
    required this.texts,
    required this.durations,
    required this.textStyles,
    this.onComplete,
  });

  @override
  _AnimatedTextSequenceState createState() => _AnimatedTextSequenceState();
}

class _AnimatedTextSequenceState extends State<AnimatedTextSequence> {
  int _visibleWordIndex = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(widget.durations[_visibleWordIndex], (timer) {
      setState(() {
        if (_visibleWordIndex < widget.texts.length - 1) {
          _visibleWordIndex++;
          timer.cancel();
          _timer = Timer.periodic(widget.durations[_visibleWordIndex], (timer) {
            setState(() {
              if (_visibleWordIndex < widget.texts.length - 1) {
                _visibleWordIndex++;
              } else {
                timer.cancel();
                if (widget.onComplete != null) {
                  widget.onComplete!();
                }
              }
            });
          });
        } else {
          timer.cancel();
          if (widget.onComplete != null) {
            widget.onComplete!();
          }
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.texts.length, (index) {
        return AnimatedOpacity(
          opacity: _visibleWordIndex >= index ? 1.0 : 0.0,
          duration: widget.durations[index],
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Text(
              widget.texts[index],
              style: widget.textStyles[index],
            ),
          ),
        );
      }),
    );
  }
}

class AnimatedTypewriterText extends StatelessWidget {
  final VoidCallback? onComplete;

  const AnimatedTypewriterText({this.onComplete});

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: GoogleFonts.poppins(fontSize: 16.0, fontWeight: FontWeight.w600, color: entireapp),
      child: AnimatedTextKit(
        animatedTexts: [
          TypewriterAnimatedText(
            'Book your turf, anytime, anywhere!',
            speed: Duration(milliseconds: 50),
          ),
        ],
        totalRepeatCount: 1,
        onFinished: onComplete,
      ),
    );
  }
}

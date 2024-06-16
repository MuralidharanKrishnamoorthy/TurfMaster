import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:turfbooking/colors/colors.dart';
import 'package:turfbooking/pages-admin/adminlogin.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _showSecondSequence = false;
  bool _showLoginAndButtons = false;
  bool _showSpinKit = false;

  void _onFirstSequenceComplete() {
    setState(() {
      _showSecondSequence = true;
    });
  }

  void _onTypewriterComplete() {
    setState(() {
      _showLoginAndButtons = true;
      _showSpinKit = true;
    });

    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _showSpinKit = false;
      });

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => adminlogin(),
        ),
      );
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
                      GoogleFonts.poppins(
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                          color: entireapp),
                      GoogleFonts.poppins(
                          fontSize: 33,
                          fontWeight: FontWeight.bold,
                          color: entireapp),
                    ],
                    onComplete: _onFirstSequenceComplete,
                  ),
                  SizedBox(height: 10),
                  if (_showSecondSequence)
                    AnimatedTypewriterText(onComplete: _onTypewriterComplete),
                  SizedBox(height: 10),
                  if (_showSpinKit)
                    SpinKitCircle(
                      color: entireapp,
                      size: 50.0,
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
      style: GoogleFonts.poppins(
          fontSize: 16.0, fontWeight: FontWeight.w600, color: entireapp),
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

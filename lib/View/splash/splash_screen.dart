import 'package:flutter/material.dart';
import 'package:voicesphere/res/Assets/image_assets.dart';
import 'package:voicesphere/View/authentication/phone.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen(this.otp, {super.key});

  void Function() otp;

  @override
  State<SplashScreen> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isImageVisible = false;
  bool _isTextVisible = false;
  bool _isButtonVisible = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        _isImageVisible = true;
      });
    });

    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _isTextVisible = true;
      });
    });

    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _isButtonVisible = true;
      });
    });

//This basically redirect your screen to the other screen after 5 seconds
//
    Future.delayed(Duration(seconds: 5), () {
      // Navigate to the next page after 5 seconds
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                Phone(widget.otp)), // replace with your actual next page widget
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 85, 24, 96),
                    Color.fromARGB(255, 199, 33, 228)
                  ], // Gradient colors
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(seconds: 2),
            curve: Curves.easeInOut,
            bottom: _isImageVisible ? 300 : -350,
            left: MediaQuery.of(context).size.width / 2 - 175,
            child: Center(
              child: Image.asset(
                ImageAssets.splashImage,
                height: 350,
                width: 350,
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(seconds: 2),
            curve: Curves.easeInOut,
            top: _isTextVisible
                ? 150
                : -100, // Animate from off-screen (-100) to on-screen (50)
            left: 0,
            right: 0,
            child: AnimatedOpacity(
              opacity: _isTextVisible ? 1.0 : 0.0,
              duration: Duration(seconds: 2),
              child: const Center(
                child: Text(
                  'Welcome to VoiceSphere',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Roboto'),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(seconds: 2),
            curve: Curves.easeInOut,
            bottom: _isButtonVisible
                ? 300
                : -50, // Adjust the final position as needed
            left: 0,
            right: 0,
            child: AnimatedOpacity(
              opacity: _isButtonVisible ? 1.0 : 0.0,
              duration: Duration(seconds: 2),
              child: Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(
                        255, 85, 24, 96), // Background color of the button
                    foregroundColor: Colors.white, // Text color of the button
                    padding: EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12), // Padding inside the button
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(12), // Rounded corners
                    ),
                  ),
                  onPressed: () {},
                  child: Text('Get Started'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

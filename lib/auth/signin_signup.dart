import 'package:flutter/material.dart';

void main() {
  runApp(const SigninSignupPage ());
}

class SigninSignupPage extends StatelessWidget {
  const SigninSignupPage({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              double screenHeight = constraints.maxHeight;
              double screenWidth = constraints.maxWidth;

              return Stack(
                children: [

                  /// Background Frame
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Image.asset(
                      'assets/images/Frame.png',
                      width: screenWidth,
                      fit: BoxFit.cover,
                    ),
                  ),

                  /// Top Logo (Group 17)
                  Positioned(
                    top: screenHeight * 0.06,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Image.asset(
                        'assets/images/Group 17.png',
                        width: screenWidth * 0.45,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),

                  /// Center Image (Group.png)
                  Positioned(
                    top: screenHeight * 0.22,
                    left: screenWidth * 0.15,
                    right: screenWidth * 0.15,
                    child: Image.asset(
                      'assets/images/Group.png',
                      fit: BoxFit.contain,
                    ),
                  ),


                  /// Bottom Content
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 30), // fixed padding
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          Text(
                            "We are what we do",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "HelveticaNeue",
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF3F414E),
                            ),
                          ),

                          const SizedBox(height: 12),


                            Text(
                              "Thousands of people are using Silent Moon\nfor small meditations",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: "HelveticaNeue",
                                fontSize: 14,
                                color: Color(0xFFA1A4B2),
                                height: 1.6,
                              ),
                            ),


                          const SizedBox(height: 60),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: SizedBox(
                              width: double.infinity,
                              height: 56,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF8E97FD), // normal color
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(38),
                                  ),
                                ),
                                child: const Text(
                                  "SIGN UP",
                                  style: TextStyle(
                                    fontFamily: "HelveticaNeue",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 18),

                          RichText(
                            text: const TextSpan(
                              style: TextStyle(
                                fontFamily: "HelveticaNeue",
                                fontSize: 14,
                                color: Color(0xFFA1A4B2),
                              ),
                              children: [
                                TextSpan(text: "ALREADY HAVE AN ACCOUNT? "),
                                TextSpan(
                                  text: "LOG IN",
                                  style: TextStyle(
                                    color: Color(0xFF8E97FD),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

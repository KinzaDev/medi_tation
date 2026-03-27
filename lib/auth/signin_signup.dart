import 'package:flutter/material.dart';
import 'package:medi/auth/sign_up.dart';
import 'sign_in.dart'; // Ensure this file exists in the same folder

void main() {
  runApp(const SigninSignupPage());
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

                  /// Top Logo
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

                  /// Center Image
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
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
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
                          const Text(
                            "Thousand of people are using silent moon\nfor smalls meditation",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "HelveticaNeue",
                              fontSize: 16,
                              fontWeight: FontWeight(300),
                              color: Color(0xFFA1A4B2),
                              height: 1.6,
                            ),
                          ),
                          const SizedBox(height: 60),

                          /// FIXED BUTTON SECTION
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: SizedBox(
                              width: double.infinity,
                              height: 56,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const SignUpPage(),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF8E97FD),
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

                          /// LOG IN LINK
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignInPage(),
                                ),
                              );
                            },
                            child: RichText(
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
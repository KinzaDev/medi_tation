import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      // Using Stack to keep curves fixed while content scrolls
      body: Stack(
        children: [
          /// 1. Top Curves (Fixed Background)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: screenHeight * 0.42,
            child: Image.asset('assets/images/curves.png', fit: BoxFit.fill),
          ),

          /// 2. Curve1 - Positioned further down and to the left
          Positioned(
            top: screenHeight * 0.21,
            left: 0,
            child: SizedBox(
              width: 130,
              child: Image.asset('assets/images/curve1.png', fit: BoxFit.contain),
            ),
          ),

          /// 3. Scrollable Content
          SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  const SizedBox(height: 10),

                  // Back Button
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back, color: Color(0xFF3F414E)),
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.all(12),
                        side: const BorderSide(color: Color(0xFFEBEAEA)),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),
                  const Text(
                    "Welcome Back!",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3F414E),
                    ),
                  ),
                  const SizedBox(height: 35),

                  // Facebook Button - Icon on Left, Text Centered
                  _buildSocialButton(
                    label: "      CONTINUE WITH FACEBOOK",
                    color: const Color(0xFF7583CA),
                    textColor: Colors.white,
                    asset: 'assets/images/Vector.png',
                    iconColor: Colors.white,
                  ),

                  const SizedBox(height: 20),

                  // Google Button - Icon on Left, Text Centered
                  _buildSocialButton(
                    label: "      CONTINUE WITH GOOGLE",
                    color: Colors.white,
                    textColor: const Color(0xFF3F414E),
                    asset: 'assets/images/google.png',
                    hasBorder: true,
                  ),

                  const SizedBox(height: 40),
                  const Text(
                    "OR LOG IN WITH EMAIL",
                    style: TextStyle(
                      color: Color(0xFFA1A4B2),
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Input Fields
                  _buildTextField("Email address"),
                  const SizedBox(height: 20),
                  _buildTextField("Password", isPass: true),

                  const SizedBox(height: 30),

                  // Login Button
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF8E97FD),
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 63),
                      shape: const StadiumBorder(),
                      elevation: 0,
                    ),
                    child: const Text(
                      "LOG IN",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),

                  const SizedBox(height: 15),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(color: Color(0xFF3F414E), fontWeight: FontWeight.w400),
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Bottom Link
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "ALREADY HAVE AN ACCOUNT? ",
                          style: TextStyle(color: Color(0xFFA1A4B2), fontSize: 12),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: const Text(
                            "SIGN UP",
                            style: TextStyle(
                              color: Color(0xFF8E97FD),
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
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
        ],
      ),
    );
  }

  // Improved Social Button Helper
  Widget _buildSocialButton({
    required String label,
    required Color color,
    required Color textColor,
    required String asset,
    bool hasBorder = false,
    Color? iconColor
  }) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: textColor,
        minimumSize: const Size(double.infinity, 63),
        shape: const StadiumBorder(),
        side: hasBorder ? const BorderSide(color: Color(0xFFEBEAEA)) : null,
        elevation: 0,
      ),
      child: Stack( // Using Stack inside the button to fix Icon position
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Image.asset(asset, height: 24, color: iconColor),
            ),
          ),
          Center(
            child: Text(
              label,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, letterSpacing: 0.5),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String hint, {bool isPass = false}) {
    return TextField(
      obscureText: isPass,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Color(0xFFA1A4B2)),
        filled: true,
        fillColor: const Color(0xFFF2F3F7),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      ),
    );
  }
}
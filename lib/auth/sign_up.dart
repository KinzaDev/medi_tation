import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          /// 1. TOP BACKGROUND CURVES
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: screenHeight * 0.42,
            child: Image.asset('assets/images/curves.png', fit: BoxFit.contain),
          ),

          /// 2. SIDE CURVE (Left side wali curve)
          Positioned(
            top: screenHeight * 0.21,
            left: 0,
            child: SizedBox(
              width: 140,
              child: Image.asset('assets/images/curve1.png', fit: BoxFit.contain),
            ),
          ),

          /// 3. MAIN CONTENT (Scrollable)
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  const SizedBox(height: 10),

                  // BACK BUTTON
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xFFEBEAEA)),
                      ),
                      child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back, color: Color(0xFF3F414E)),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),
                  const Text(
                    'Create your account',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3F414E),
                    ),
                  ),

                  const SizedBox(height: 35),

                  // FACEBOOK BUTTON
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: const Color(0xFF7583CA),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 25),

                        Image.asset('assets/images/Vector.png', height: 25, color: Colors.white),
                        const Expanded(
                          child: Center(
                            child: Text(
                              "CONTINUE WITH FACEBOOK",
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
                            ),
                          ),
                        ),
                        const SizedBox(width: 40),
                      ],
                    ),
                  ),


                  const SizedBox(height: 15),

                  // GOOGLE BUTTON
                  Container(

                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color:Color(0xFFA3A5B2)),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 25),
                        Image.asset('assets/images/google.png', height: 25),
                        const Expanded(
                          child: Center(
                            child: Text(
                              "CONTINUE WITH GOOGLE",
                              style: TextStyle(color: Color(0xFF3F414E), fontWeight: FontWeight.bold, fontSize: 13),
                            ),

                          ),

                        ),
                        const SizedBox(width: 50),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),
                  const Text(
                    "OR LOG IN WITH EMAIL",
                    style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                  const SizedBox(height: 30),

                  // NAME INPUT
                  _customTextField(hint: "afsar", icon: Icons.check, iconColor: Colors.green),
                  const SizedBox(height: 15),

                  // EMAIL INPUT
                  _customTextField(hint: "imshuvo97@gmail.com", icon: Icons.check, iconColor: Colors.green),
                  const SizedBox(height: 15),

                  // PASSWORD INPUT
                  _customTextField(hint: "●●●●●●●●●", icon: Icons.visibility_off_outlined, isPassword: true),

                  const SizedBox(height: 20),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: "i have read the ",
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                          children: [
                            TextSpan(
                              text: "Privacy Policy",
                              style: TextStyle(color: Color(0xFF7583CA), fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Checkbox(
                        value: isChecked,
                        activeColor: Color(0xFF7583CA),
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                        side:BorderSide(color: Colors.grey),
                      ),
                    ],
                  ),

                   SizedBox(height: 30),

                  // GET STARTED BUTTON
                  SizedBox(
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF8E97FD),
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      ),
                      child: const Text(
                        "GET STARTED",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget _customTextField({required String hint, required IconData icon, Color iconColor = Colors.grey, bool isPassword = false}) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: const Color(0xFFF2F3F7),
        suffixIcon: Icon(icon, color: iconColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      ),
    );
  }
}
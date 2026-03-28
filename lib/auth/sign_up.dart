import 'package:flutter/material.dart';
import 'package:medi/screens/welcome.dart';
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isChecked = false;
  bool _isPasswordVisible = false; // Password show/hide control karne ke liye

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
            child: Image.asset(
              'assets/images/curves.png',
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => const SizedBox(),
            ),
          ),

          /// 2. SIDE CURVE
          Positioned(
            top: screenHeight * 0.21,
            left: 0,
            child: SizedBox(
              width: 140,
              child: Image.asset(
                'assets/images/curve1.png',
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => const SizedBox(),
              ),
            ),
          ),

          /// 3. MAIN CONTENT
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

                  // FACEBOOK BUTTON (ElevatedButton)
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton.icon(
                      onPressed: () => debugPrint("Facebook Clicked"),
                      icon: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Image.asset('assets/images/Vector.png', height: 25, color: Colors.white,
                            errorBuilder: (c, e, s) => const Icon(Icons.facebook, color: Colors.white)),
                      ),
                      label: const Expanded(
                        child: Center(
                          child: Text(
                            "CONTINUE WITH FACEBOOK",
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
                          ),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF7583CA),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        elevation: 0,
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  // GOOGLE BUTTON (ElevatedButton)
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton.icon(
                      onPressed: () => debugPrint("Google Clicked"),
                      icon: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Image.asset('assets/images/google.png', height: 25,
                            errorBuilder: (c, e, s) => const Icon(Icons.g_mobiledata, color: Colors.red, size: 30)),
                      ),
                      label: const Expanded(
                        child: Center(
                          child: Text(
                            "CONTINUE WITH GOOGLE",
                            style: TextStyle(color: Color(0xFF3F414E), fontWeight: FontWeight.bold, fontSize: 13),
                          ),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.grey.shade300,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: const BorderSide(color: Color(0xFFA3A5B2)),
                        ),
                        elevation: 0,
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),
                  const Text(
                    "OR LOG IN WITH EMAIL",
                    style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                  const SizedBox(height: 30),

                  _customTextField(hint: "Name", icon: Icons.check, iconColor: Colors.green),
                  const SizedBox(height: 15),
                  _customTextField(hint: "Email address", icon: Icons.check, iconColor: Colors.green),
                  const SizedBox(height: 15),

                  _customTextField(
                    hint: "Password",
                    icon: Icons.visibility_off_outlined,
                    isPassword: true,
                  ),

                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text.rich(
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
                        activeColor: const Color(0xFF7583CA),
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                        side: const BorderSide(color: Colors.grey),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Welcome()),
                        );
                      },
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

  Widget _customTextField({
    required String hint,
    required IconData icon,
    Color iconColor = Colors.grey,
    bool isPassword = false,
  }) {
    return TextField(

      obscureText: isPassword ? !_isPasswordVisible : false,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: const Color(0xFFF2F3F7),


        suffixIcon: isPassword
            ? IconButton(
          icon: Icon(
            _isPasswordVisible ? Icons.visibility : Icons.visibility_off_outlined,
            color: Colors.grey,
          ),
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
        )
            : Icon(icon, color: iconColor),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      ),
    );
  }
}
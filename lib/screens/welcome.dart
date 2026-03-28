import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF8E97FD),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),

            Image.asset(
              'assets/images/Group 16.png',
              height: 30,
            ),

            const SizedBox(height: 40),

            // Welcome Text Section
            const Text(
              'Hi Afsar, Welcome',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFFFECCC),
                fontSize: 28,
                fontWeight: FontWeight.w700,
                fontFamily: "HelveticaNeue",
              ),
            ),
            const Text(
              'to Silent Moon',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFFFECCC),
                fontSize: 28,
                fontFamily: "HelveticaNeue",
                fontWeight: FontWeight.w100,
              ),
            ),

            const SizedBox(height: 15),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Explore the app, Find some peace of mind to prepare for meditation.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                  fontFamily: "HelveticaNeue",
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),

            const Spacer(),

            // --- STACK USED HERE TO PUT BUTTON OVER IMAGE ---
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                // 1. Background Image
                Image.asset(
                  'assets/images/welcome_page.png',
                  fit: BoxFit.contain,
                  width: MediaQuery.of(context).size.width,
                ),

                // 2. Button (Aligned slightly above the bottom)
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
                  child: SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFEBEAEC),
                        foregroundColor: const Color(0xFF3F414E),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "GET STARTED",
                        style: TextStyle(
                          fontFamily: "HelveticaNeue",
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:medi/screens/sleep.dart';

class WelcomeSleep extends StatelessWidget {
  const WelcomeSleep({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF03174C),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/welcome_sleep/Group.png',
              fit: BoxFit.cover,
            ),
          ),
           Align(
             alignment: AlignmentGeometry.xy(0.4, -0.8),
             child:
             Image.asset(
              'assets/images/welcome_sleep/image.png',
              fit: BoxFit.cover,
            ),
           ),
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 100),

                // Header Text
                const Text(
                  'Welcome to Sleep',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontFamily: 'Helvetica Neue',
                    fontWeight: FontWeight.w700,
                  ),
                ),

                const SizedBox(height: 20),


                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    'Explore the new king of sleep. It uses sound and visualization to create perfect conditions for refreshing sleep.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Helvetica Neue',
                      color: Colors.white70,
                      fontWeight: FontWeight.w300,
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                ),

                const Spacer(),

                Align(
                  alignment: AlignmentGeometry.centerRight,
                  child: Image.asset(
                    'assets/images/welcome_sleep/birds.png',
                    width: MediaQuery.of(context).size.width * 0.8,
                  ),
                ),
                const Spacer(),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 40,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Sleep()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF8E97FD),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'GET STARTED',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

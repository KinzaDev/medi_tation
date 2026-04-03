import 'package:flutter/material.dart';
import 'package:medi/screens/reminders.dart';

class ChooseTopic extends StatelessWidget {
  const ChooseTopic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // Background Image
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                'assets/images/Union.png',
                fit: BoxFit.fill,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 76),
                  const Text(
                    "What Brings you",
                    style: TextStyle(
                      fontSize: 28,
                      fontFamily: 'HelveticaNeue',
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  const Text(
                    "to Silent Moon?",
                    style: TextStyle(
                      fontSize: 28,
                      fontFamily: 'HelveticaNeue',
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "choose a topic to focus on:",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'HelveticaNeue',
                      fontWeight: FontWeight.w300,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Expanded(
                    child: ListView(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // LEFT COLUMN
                            Expanded(
                              child: Column(
                                children: [
                                  _buildTopicCard(
                                    context,
                                    "Reduce Stress",
                                    const Color(0xFF8E97FD),
                                    180,
                                    imagePath: 'assets/images/stress.png',
                                  ),
                                  const SizedBox(height: 15),
                                  _buildTopicCard(
                                    context,
                                    "Increase Happiness",
                                    const Color(0xFFFEB18F),
                                    180,
                                    imagePath: 'assets/images/Group 3.png',
                                  ),
                                  const SizedBox(height: 15),
                                  _buildTopicCard(
                                    context,
                                    "Personal Growth",
                                    const Color(0xFF6CB28E),
                                    180,
                                    imagePath: 'assets/images/Frame (2).png',
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 15),
                            // RIGHT COLUMN
                            Expanded(
                              child: Column(
                                children: [
                                  _buildTopicCard(
                                    context,
                                    "Improve Performance",
                                    const Color(0xFFFA6E5A),
                                    180,
                                    imagePath: 'assets/images/Frame (1).png',
                                    isType2: true,
                                  ),
                                  const SizedBox(height: 15),
                                  _buildTopicCard(
                                    context,
                                    "Reduce Anxiety",
                                    const Color(0xFFFFDB9D),
                                    180,
                                    imagePath: 'assets/images/Group (1).png',
                                    isType2: true,
                                  ),
                                  const SizedBox(height: 15),
                                  _buildTopicCard(
                                    context,
                                    "Better Sleep",
                                    const Color(0xFF4E5567),
                                    180,
                                    imagePath: 'assets/images/Group (2).png',

                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildTopicCard(
      BuildContext context,
      String title,
      Color color,
      double height, {
        String? imagePath,
        bool isType2 = false,
      }) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [

            if (imagePath != null)
              Positioned(
                top: isType2 ? 20 : 0,
                right: isType2 ? 20 : 0,
                left: isType2 ? 20 : 0,
                child: Image.asset(imagePath, fit: BoxFit.contain),
              ),


            Padding(
              padding: const EdgeInsets.all(10),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),


            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Reminders()),
                  );
                },
                splashColor: Colors.white.withOpacity(0.3),
                highlightColor: Colors.white.withOpacity(0.1),
                child: const SizedBox.expand(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
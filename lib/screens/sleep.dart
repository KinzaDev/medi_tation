import 'package:flutter/material.dart';
import 'package:medi/Widgets/home_page_widgets.dart';

class Sleep extends StatefulWidget {
  const Sleep({super.key});

  @override
  State<Sleep> createState() => _SleepState();
}

class _SleepState extends State<Sleep> {
  int _currentIndex = 1;
  String selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF03174C),
      body: Stack(
        children: [
          Image.asset(
            'assets/sleep/half.png',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  const Text(
                    'Sleep Stories',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontFamily: 'Helvetica Neue',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Soothing bedtime stories to help you fall\n'
                    'into a deep and natural sleep',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      height: 1.3,
                    ),
                  ),

                  const SizedBox(height: 30),

                  SleepCategoryBar(
                    selectedCategory: selectedCategory,
                    onCategorySelected: (category) {
                      setState(() {
                        selectedCategory = category;
                      });
                    },
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 25,
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/sleep/ocean.jpg',
                            width: double.infinity,
                            height: 233,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 15,
                          left: 15,
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.2),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.lock_outline_rounded,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            const Text(
                              'The Ocean Moon',
                              style: TextStyle(
                                color: Color(0xFFFFE082),
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Non-stop 8-hour mixes of our\nmost popular sleep audio',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 15),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 25,
                                  vertical: 10,
                                ),
                              ),
                              child: const Text(
                                'START',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 0,
                      childAspectRatio: 0.85,
                      children: [
                        SleepCard(
                          title: 'Night Island',
                          duration: '45 MIN',
                          type: 'SLEEP MUSIC',
                          imagePath: 'assets/sleep/yellow moon.png',
                          onTap: () {},
                        ),
                        SleepCard(
                          title: 'Sweet Sleep',
                          duration: '45 MIN',
                          type: 'SLEEP MUSIC',
                          imagePath: 'assets/sleep/three owl.png',
                          onTap: () {},
                        ),
                        SleepCard(
                          title: 'Moon Clouds',
                          duration: '45 MIN',
                          type: 'SLEEP MUSIC',
                          imagePath: 'assets/sleep/pink moon.png',
                          onTap: () {},
                        ),
                        SleepCard(
                          title: 'Owl Night',
                          duration: '45 MIN',
                          type: 'SLEEP MUSIC',
                          imagePath: 'assets/sleep/owl.png',
                          onTap: () {},
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
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        backgroundColor: const Color(0xFF03174C),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

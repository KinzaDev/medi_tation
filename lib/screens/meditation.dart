import 'package:flutter/material.dart';
import '../Widgets/home_page_widgets.dart';

class MeditateScreen extends StatefulWidget {
  const MeditateScreen({super.key});

  @override
  State<MeditateScreen> createState() => _MeditateScreenState();
}

class _MeditateScreenState extends State<MeditateScreen> {

  String selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 30),
              const Text(
                'Meditate',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Helvetica Neue'),
              ),
              const SizedBox(height: 10),
              const Text(
                'we can learn how to recognize when our minds\nare doing their normal everyday acrobatics.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontFamily: 'Helvetica Neue'),
              ),
              const SizedBox(height: 30),

              // Horizontal Categories Section
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildCategory('All', 'assets/images/meditate/all.png'),
                    _buildCategory('My', 'assets/images/meditate/heart.png'),
                    _buildCategory('Anxious', 'assets/images/meditate/emoji.png'),
                    _buildCategory('Sleep', 'assets/images/meditate/sleep.png'),
                    _buildCategory('Kids', 'assets/images/meditate/face.png'),
                  ],
                ),
              ),
              const SizedBox(height: 25),

              // Daily Calm Card
              Container(
                height: 95,
                decoration: BoxDecoration(
                  color: const Color(0xFFF1D1B5),
                  borderRadius: BorderRadius.circular(15),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/meditate/daily.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Daily Calm',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          Text('APR 30 • PAUSE PRACTICE',
                              style: TextStyle(fontSize: 12)),
                        ],
                      ),
                      const Icon(Icons.play_circle_fill,
                          size: 40, color: Color(0xFF3F414E)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Grid Section
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        _buildGridCard('', 'assets/images/meditate/calm.png', 210),
                        const SizedBox(height: 15),
                        _buildGridCard('', 'assets/images/meditate/beach.png', 160),
                      ],
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      children: [
                        _buildGridCard(
                            'Anxiety Release', 'assets/images/meditate/anxity.png', 160),
                        const SizedBox(height: 15),
                        _buildGridCard('', 'assets/images/meditate/windy.png', 210),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 2,
        onTap: (index) {
          // Navigation logic handles here
        },
      ),
    );
  }


  Widget _buildCategory(String label, String iconPath) {

    bool isSelected = selectedCategory == label;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = label;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 15),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xFF8E97FD)
                    : const Color(0xFFA0A3B1).withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(
                iconPath,
                width: 25,
                height: 25,
                color: isSelected ? Colors.white : Colors.grey,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.black : Colors.grey,
                fontSize: 13,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridCard(String title, String asset, double height) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(image: AssetImage(asset), fit: BoxFit.cover),
      ),
      padding: const EdgeInsets.all(15),
      alignment: Alignment.bottomLeft,
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }
}
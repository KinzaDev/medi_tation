import 'package:flutter/material.dart';
import 'package:medi/screens/meditation.dart';
import 'package:medi/screens/music_v2.dart';
import '../screens/home.dart';
import 'package:medi/screens/welcome_sleep.dart';



class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Color(0xFFE6E6E6), width: 0.5)),
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(context, 0, 'assets/images/home .png', 'Home'),
            _buildNavItem(context, 1, 'assets/images/moon.png', 'Sleep'),
            _buildNavItem(context, 2, 'assets/images/App (2).png', 'Meditate'),
            _buildNavItem(context, 3, 'assets/images/music.png', 'Music'),
            _buildNavItem(context, 4, 'assets/images/profile.png', 'Afsar'),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, int index, String assetPath, String label) {
    final bool isSelected = currentIndex == index;
    final Color activeColor = const Color(0xFF8E97FD);
    final Color inactiveColor = Colors.grey;

    return GestureDetector(
      onTap: () {
        onTap(index);
        Widget nextScreen;
        switch (index) {
          case 0:
            nextScreen = const Home();
            break;
          case 1:
            nextScreen = const WelcomeSleep();
            break;
          case 2:
            nextScreen = const MeditateScreen();
            break;
          case 3:
            nextScreen = const MusicV2();
            break;
            default:
            nextScreen = const Home();
        }
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => nextScreen),
        );
      },
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isSelected ? activeColor : Colors.transparent,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Image.asset(
              assetPath,
              width: 24,
              height: 24,
              color: isSelected ? Colors.white : inactiveColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? activeColor : inactiveColor,
              fontSize: 14,
              fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

// ---  ACTION CARD CLASS ---
class ActionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;
  final Color bgColor;
  final Color titleColor;
  final Color btnColor;
  final Color btnTextColor;
  final String imagePath;
  final VoidCallback onStartTap;

  const ActionCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.bgColor,
    required this.titleColor,
    required this.btnColor,
    required this.btnTextColor,
    required this.imagePath,
    required this.onStartTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            right: 2,
            top: 2,
            child: Image.asset(imagePath, height: 160),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: titleColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: titleColor.withValues(alpha: 0.8),
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      time,
                      style: TextStyle(color: titleColor, fontSize: 11),
                    ),
                    SizedBox(
                      height: 35,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: btnColor,
                          foregroundColor: btnTextColor,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                        ),
                        onPressed: onStartTap,
                        child: const Text(
                          "START",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ActionCard1 extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;
  final Color bgColor;
  final Color titleColor;
  final Color btnColor;
  final Color btnTextColor;
  final String imagePath;
  final VoidCallback onStartTap;

  const ActionCard1({
    super.key,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.bgColor,
    required this.titleColor,
    required this.btnColor,
    required this.btnTextColor,
    required this.imagePath,
    required this.onStartTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            right: 2,
            top: 2,
            child: Image.asset(imagePath, height: 210),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: titleColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: titleColor.withValues(alpha: 0.8),
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      time,
                      style: TextStyle(color: titleColor, fontSize: 11),
                    ),
                    SizedBox(
                      height: 35,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: btnColor,
                          foregroundColor: btnTextColor,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                        ),
                        onPressed: onStartTap,
                        child: const Text(
                          "START",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Course extends StatefulWidget {
  const Course({super.key});

  @override
  State<Course> createState() => _CourseState();
}

class _CourseState extends State<Course> {
  String selectedNarrator = "MALE VOICE";
  int selectedTrackIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // 1. FIXED TOP SECTION (Image and Header Info)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  const Image(
                    image: AssetImage('assets/images/course_detail/sun.png'),
                    width: double.infinity,
                    height: 280,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 50,
                    left: 20,
                    right: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildCircleButton(
                          icon: Icons.arrow_back,
                          onTap: () => Navigator.pop(context),
                        ),
                        Row(
                          children: [
                            _buildCircleButton(
                              icon: Icons.favorite_border,
                              onTap: () {},
                            ),
                            const SizedBox(width: 15),
                            _buildCircleButton(
                              icon: Icons.file_download_outlined,
                              onTap: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Happy Morning',
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF3F414E),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'COURSE',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Ease the mind into a restful night’s welcome_sleep with these deep, ambient tones.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 30),
                    // Stats section (The boundary for scrolling)
                    Row(
                      children: [
                        _buildStatItem(
                          Icons.favorite,
                          const Color(0xFFFF84A2),
                          "24.234 Favorites",
                        ),
                        const SizedBox(width: 30),
                        _buildStatItem(
                          Icons.headset,
                          const Color(0xFF7FD2F2),
                          "34.234 Listening",
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),

          // 2. SCROLLABLE BOTTOM SECTION
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Pick a Narrator',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF3F414E),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      _buildTabItem(
                        "MALE VOICE",
                        selectedNarrator == "MALE VOICE",
                      ),
                      const SizedBox(width: 40),
                      _buildTabItem(
                        "FEMALE VOICE",
                        selectedNarrator == "FEMALE VOICE",
                      ),
                    ],
                  ),
                  const Divider(height: 1, color: Color(0xFFE6E6E6)),
                  const SizedBox(height: 10),

                  // List of tracks
                  _buildTrackRow("Focus Attention", "10 MIN", 0),
                  _buildTrackRow("Body Scan", "5 MIN", 1),
                  _buildTrackRow("Making Happiness", "3 MIN", 2),
                  _buildTrackRow("Deep Breathing", "7 MIN", 3),
                  _buildTrackRow("Visualizing Peace", "12 MIN", 4),
                  _buildTrackRow("Evening Wind Down", "15 MIN", 5),

                  // Bottom spacing for better UX
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- Helper Methods ---

  Widget _buildCircleButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.9),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.black87, size: 24),
      ),
    );
  }

  Widget _buildStatItem(IconData icon, Color color, String label) {
    return Row(
      children: [
        Icon(icon, color: color, size: 20),
        const SizedBox(width: 8),
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 14)),
      ],
    );
  }

  Widget _buildTabItem(String label, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedNarrator = label;
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: isSelected ? const Color(0xFF8E97FD) : Colors.grey,
            ),
          ),
          const SizedBox(height: 8),
          if (isSelected)
            Container(height: 3, width: 85, color: const Color(0xFF8E97FD)),
        ],
      ),
    );
  }

  Widget _buildTrackRow(String title, String subtitle, int index) {
    bool isActive = selectedTrackIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTrackIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isActive ? const Color(0xFF8E97FD) : Colors.transparent,
                border: Border.all(
                  color: isActive ? Colors.transparent : Colors.grey.shade300,
                ),
              ),
              child: Icon(
                Icons.play_arrow,
                color: isActive ? Colors.white : Colors.grey,
              ),
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3F414E),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
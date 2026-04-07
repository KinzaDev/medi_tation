import 'package:flutter/material.dart';
import 'package:medi/Widgets/home_page_widgets.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  void _onNavTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Center(
                child: Image.asset('assets/images/Group 17.png', height: 30),
              ),
              const SizedBox(height: 40),
              const Text(
                'Good Morning, Afsar',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 28,
                  color: Color(0xFF3F414E),
                ),
              ),
              const Text(
                'We Wish you have a good day',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 20,
                  color: Color(0xFFA1A4B2),
                ),
              ),
              const SizedBox(height: 30),

              // --- Grid Cards with Increased Image Size ---
              Row(
                children: [
                  Expanded(
                    child: ActionCard1(
                      title: "Basics",
                      subtitle: "COURSE",
                      time: "3-10 MIN",
                      bgColor: const Color(0xFF8E97FD),
                      titleColor: const Color(0xFFFEE3BA),
                      btnColor: const Color(0xFFEBEAEC),
                      btnTextColor: const Color(0xFF3F414E),
                      imagePath: 'assets/images/home_page_1.png',
                      onStartTap: () {},
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: ActionCard(
                      title: "Relaxation",
                      subtitle: "MUSIC",
                      time: "3-10 MIN",
                      bgColor: const Color(0xFFFFC97E),
                      titleColor: const Color(0xFF3F414E),
                      btnColor: const Color(0xFF3F414E),
                      btnTextColor: Colors.white,
                      imagePath: 'assets/images/home_page_2.png',
                      onStartTap: () {},
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              _buildDailyThought(),

              const SizedBox(height: 40),
              const Text(
                'Recomended for you',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: Color(0xFF3F414E),
                ),
              ),
              const SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    child: _cards(
                      "Focus",
                      "MEDITATION • 3-10 MIN",
                      'assets/images/home_page_3.png',
                      const Color(0xFFAFD3E2),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: _cards(
                      "Happiness",
                      "MEDITATION • 3-10 MIN",
                      'assets/images/home_page_4.png',
                      const Color(0xFFFEE3BA),
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
        currentIndex: _currentIndex,
        onTap: _onNavTap,
      ),
    );
  }

  Widget _buildDailyThought() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: const Color(0xFF3F414E),
        borderRadius: BorderRadius.circular(15),
        image: const DecorationImage(
          image: AssetImage('assets/images/Mask Group.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Daily Thought",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "MEDITATION • 3-10 MIN",
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.play_circle_fill,
              color: Colors.white,
              size: 45,
            ),
          ),
        ],
      ),
    );
  }

  Widget _cards(
    String title,
    String desc,
    String img,
    Color boxColor,
  ) {
    return Container(
      width: 162,

      margin: const EdgeInsets.only(right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Background Box for Image
          Container(
            height: 113,
            width: 162,
            decoration: BoxDecoration(
              color: boxColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(img, fit: BoxFit.fill),
            ),
          ),

          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Color(0xFF3F414E),
            ),
          ),
          Text(
            desc,
            style: const TextStyle(color: Color(0xFFA1A4B2), fontSize: 11),
          ),
        ],
      ),
    );
  }
}

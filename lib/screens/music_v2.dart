import 'package:flutter/material.dart';

class MusicV2 extends StatefulWidget {
  const MusicV2({super.key});

  @override
  State<MusicV2> createState() => _MusicV2State();
}

class _MusicV2State extends State<MusicV2> {
  bool isFavorite = false;
  bool isPlaying = false;


  double totalDuration = 2700;
  double currentSeconds = 90;

  String formatTime(double seconds) {
    int minutes = (seconds / 60).floor();
    int remainingSeconds = (seconds % 60).floor();
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F3F0),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/music/music.png',
              fit: BoxFit.cover,
              opacity: const AlwaysStoppedAnimation(.5),
              errorBuilder: (context, error, stackTrace) => Container(color: const Color(0xFFF7F3F0)),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height:10),
                _buildTopBar(context),
                const Spacer(flex: 1),
                _buildTitleSection(),
                const SizedBox(height: 100),
                _buildControls(),

                _buildSeekBar(),
                const Spacer(flex: 1,),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: _iconCircle(Icons.close, Colors.white, Colors.black),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () => setState(() => isFavorite = !isFavorite),
                child: _iconCircle(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  isFavorite ? Colors.red.withAlpha(40) : Colors.grey.withAlpha(120),
                  isFavorite ? Colors.red : Colors.white,
                ),
              ),
              const SizedBox(width: 15),
              _iconCircle(Icons.file_download_outlined, Colors.grey.withAlpha(120), Colors.white),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTitleSection() {
    return const Column(
      children: [
        Text(
          'Focus Attention',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF3F414E),fontFamily: 'Helvetic Neue'),
        ),
        SizedBox(height: 10),
        Text(
          '7 DAYS OF CALM',
          style: TextStyle(fontSize: 14, color: Color(0xFFA1A4B2),fontFamily: 'Helvetic Neue',),
        ),
      ],
    );
  }

  Widget _buildControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        IconButton(
          onPressed: () {
            setState(() {
              currentSeconds = (currentSeconds - 10).clamp(0, totalDuration);
            });
          },
          icon: const Icon(Icons.replay_10, size: 40, color: Color(0xFFA1A4B2)),
        ),
        const SizedBox(width: 20),
        // PLAY / PAUSE
        GestureDetector(
          onTap: () => setState(() => isPlaying = !isPlaying),
          child: Container(
            height: 85, width: 85,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFF3F414E),
              border: Border.all(color: Colors.white.withAlpha(150), width: 8),
            ),
            child: Icon(isPlaying ? Icons.play_arrow : Icons.pause, color: Colors.white, size: 45),
          ),
        ),
        const SizedBox(width: 20),
        // FORWARD 15 SECONDS
        IconButton(
          onPressed: () {
            setState(() {
              currentSeconds = (currentSeconds + 10).clamp(0, totalDuration);
            });
          },
          icon: const Icon(Icons.forward_10, size: 40, color: Color(0xFFA1A4B2)),
        ),
      ],
    );
  }

  Widget _buildSeekBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        children: [
          SliderTheme(
            data: SliderThemeData(
              trackHeight: 3,
              activeTrackColor: const Color(0xFF3F414E),
              inactiveTrackColor: Colors.black.withAlpha(30),
              thumbColor: const Color(0xFF3F414E),
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 7),
            ),
            child: Slider(
              value: currentSeconds,
              max: totalDuration,
              onChanged: (value) => setState(() => currentSeconds = value),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(formatTime(currentSeconds), style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(formatTime(totalDuration), style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _iconCircle(IconData icon, Color bgColor, Color iconColor) {
    return Container(
      height: 45, width: 45,
      decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
      child: Icon(icon, color: iconColor, size: 22),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_proj/components/app_bar.dart';
import 'package:sample_proj/widgets/custom_bottom_nav.dart';
import 'package:sample_proj/screens/upload_screen.dart';
import 'package:sample_proj/screens/user_profile_screen.dart';
import 'package:sample_proj/screens/journey_screen.dart';

class JourneyScreen extends StatefulWidget {
  final String username;
  const JourneyScreen({super.key, required this.username});

  @override
  State<JourneyScreen> createState() => _JourneyScreenState();
}

class _JourneyScreenState extends State<JourneyScreen> {
  int _selectedIndex = 3; // Since this is Journey screen

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // Allow content behind bottom nav
      body: Stack(
        children: [
          // GlassAppBar stays on top
          const GlassAppBar(),

          // Two floating buttons without any container
          Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Create Journey Button (Glass look)
                GlassmorphicContainer(
                  width: 150,
                  height: 50,
                  borderRadius: 30,
                  blur: 20,
                  alignment: Alignment.center,
                  border: 0,
                  linearGradient: LinearGradient(
                    colors: [
                      Colors.black,
                      Colors.black,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderGradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.7),
                      Colors.white.withOpacity(0.2),
                    ],
                  ),
                  child: Center( // 🪄 Ensure proper text alignment
                    child: Text(
                      'Create Journey',
                      style: GoogleFonts.montserrat(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(width: 16),

                // Memories Button (Pink)
                ElevatedButton(
                  onPressed: () {
                    // Handle Memories action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pinkAccent.withOpacity(0.9),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    textStyle: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  child: const Text('Memories'),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _selectedIndex,
        onTap: (index) {
          if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      UploadScreen(username: widget.username)),
            );
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      UserProfileScreen(username: widget.username)),
            );
          } else if (index == 3) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      JourneyScreen(username: widget.username)),
            );
          } else {
            setState(() {
              _selectedIndex = index;
            });
          }
        },
      ),
    );
  }
}

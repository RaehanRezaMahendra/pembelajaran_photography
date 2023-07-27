import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pembelajaran_photography/common/images.dart';
import 'package:pembelajaran_photography/view/pages/home_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 1.6,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(45.0),
              ),
              color: Colors.deepPurple,
            ),
            child: Image.asset(AppImages.logo),
          ).animate().fadeIn(),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Menjadi Ahli Fotografi dengan Media Pembelajaran Interaktif!",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ).animate(delay: 200.ms).fadeIn(),
          const Spacer(),
          SizedBox(
            height: 50.0,
            width: 150.0,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
              ),
              onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  )),
              child: const Text(
                "Ayo Mulai",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ),
          ).animate(delay: 500.ms).scale(),
          const SizedBox(
            height: 40.0,
          ),
        ],
      ),
    );
  }
}

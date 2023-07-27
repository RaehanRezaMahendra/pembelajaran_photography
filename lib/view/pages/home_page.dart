

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pembelajaran_photography/common/images.dart';
import 'package:pembelajaran_photography/view/pages/materi-camera-angle/materi_camera_angle_page.dart';
import 'package:pembelajaran_photography/view/pages/materi/materi_page.dart';
import 'package:pembelajaran_photography/view/pages/quiz/quiz_page.dart';
import 'package:pembelajaran_photography/view/widgets/image_text_button.dart';
import 'package:pembelajaran_photography/view/pages/simulator/Kamera_page.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  peringatanKamera(BuildContext context){
    AlertDialog(
      title: const Text("Peringatan"),
      content: const Text("Aplikasi ini membutuhkan akses kamera untuk dapat berjalan dengan baik"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => KameraPage(),
              )
            );
          },
          child: const Text("OK"),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          Image.asset(AppImages.logo),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          const SizedBox(
            height: 20.0,
          ),
          CustomImageButton(
            text: "Materi",
            imagePath:
                "https://enjintuls.com/wp-content/uploads/2022/02/art-backdrop-bright-equipment.jpg",
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MateriPage(),
                )),
          ).animate(delay: 250.ms).scale(),
          const SizedBox(
            height: 20.0,
          ),
          CustomImageButton(
            text: "Materi Angle Kamera",
            imagePath:
                "https://enjintuls.com/wp-content/uploads/2022/02/art-backdrop-bright-equipment.jpg",
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MateriCameraAnglePage(),
                )),
          ).animate(delay: 500.ms).scale(),
          const SizedBox(
            height: 20.0,
          ),
          CustomImageButton(
            text: "Simulator Kamera",
            imagePath:
                "https://enjintuls.com/wp-content/uploads/2022/02/art-backdrop-bright-equipment.jpg",
            onPressed: () {
              print('try show dialog');
              showDialog(
                context: context, 
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Peringatan"),
                    content: const Text("Aplikasi ini membutuhkan akses kamera untuk dapat berjalan dengan baik"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => KameraPage(),
                            )
                          );
                        },
                        child: const Text("OK"),
                      ),
                    ],
                  );
                }
              );
              print('show dialog');
            }
          ).animate(delay: 250.ms).scale(),
          const SizedBox(
            height: 20.0,
          ),
          CustomImageButton(
            text: "Kuis",
            imagePath:
                "https://enjintuls.com/wp-content/uploads/2022/02/art-backdrop-bright-equipment.jpg",
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const QuizPage(),
                )),
          ).animate(delay: 1000.ms).scale(),
          const SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pembelajaran_photography/common/images.dart';
import 'package:pembelajaran_photography/model/quiz_model.dart';
import 'package:pembelajaran_photography/view/pages/quiz/do_quiz_page.dart';
import 'package:pembelajaran_photography/view/pages/quiz/view_quiz_page.dart';

class QuizDonePage extends StatelessWidget {
  const QuizDonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hasil Kuis"),
        actions: [
          Image.asset(AppImages.logo),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 180.0,
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: Colors.grey[900]!,
                ),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Congrats"),
                  Text(
                    "85%",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            const Text(
              "Salah 7",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                color: Colors.red,
              ),
            ),
            const Text(
              "Benar 13",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                color: Colors.green,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ViewQuizPage(
                      quizModel: QuizModel(
                        number: 1,
                        question:
                            "Dalam fotografi, apa yang dimaksud dengan \"komposisi\"?",
                        options: [
                          "Proses pengolahan foto menggunakan perangkat lunak",
                          "Pengaturan kecerahan dan kontras dalam gambar",
                          "Tata letak dan pengaturan elemen visual dalam sebuah foto",
                          "Proses pengambilan gambar dengan menggunakan kamera",
                        ],
                        answer:
                            "Proses pengambilan gambar dengan menggunakan kamera",
                        correctAnswer:
                            "Tata letak dan pengaturan elemen visual dalam sebuah foto",
                      ),
                    ),
                  )),
              child: const Text("Lihat Jawaban"),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.deepPurple,
                    side: const BorderSide(
                      color: Colors.deepPurple,
                    ),
                  ),
                  onPressed: () =>
                      Navigator.popUntil(context, (route) => route.isFirst),
                  child: const Text("Kembali ke Home"),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                  ),
                  onPressed: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DoQuizPage(
                          quizModel: QuizModel(
                            number: 1,
                            question: "Apa fungsi dari aperture pada kamera?",
                            options: [
                              "Mengatur kecepatan rana",
                              "Mengatur kedalaman bidang (depth of field)",
                              "Mengatur sensitivitas cahaya (ISO)",
                              "Mengatur sudut pandang (angle of view)",
                            ],
                            correctAnswer:
                                'Mengatur kedalaman bidang (depth of field)',
                          ),
                        ),
                      )),
                  child: const Text(
                    "Kuis Selanjutnya",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ).animate().scale(),
    );
  }
}

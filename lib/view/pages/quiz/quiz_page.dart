import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pembelajaran_photography/common/images.dart';
import 'package:pembelajaran_photography/model/quiz_model.dart';
import 'package:pembelajaran_photography/view/pages/quiz/do_quiz_page.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kuis"),
        actions: [
          Image.asset(AppImages.logo),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: 8,
        itemBuilder: (context, index) => Card(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.deepPurple[200],
            ),
            child: ListTile(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DoQuizPage(
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
                        correctAnswer:
                            'Tata letak dan pengaturan elemen visual dalam sebuah foto',
                      ),
                    ),
                  )),
              title: const Text("Dasar-dasar Fotografi"),
              subtitle: const Text(
                "20 soal",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: const Icon(Icons.chevron_right),
            ),
          ),
        ).animate(delay: (int.parse("${index}00")).ms).fadeIn(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pembelajaran_photography/common/images.dart';
import 'package:pembelajaran_photography/model/quiz_model.dart';
import 'package:pembelajaran_photography/view/pages/quiz/quiz_done_page.dart';

class ViewQuizPage extends StatelessWidget {
  final QuizModel quizModel;

  const ViewQuizPage({
    super.key,
    required this.quizModel,
  });

  @override
  Widget build(BuildContext context) {
    int selectedOption =
        quizModel.options.indexWhere((element) => element == quizModel.answer);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Kuis"),
        actions: [
          Image.asset(AppImages.logo),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey[900]!,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${quizModel.number}. "),
                Flexible(
                  child: Text(quizModel.question),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Column(
            children: List.generate(quizModel.options.length, (index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: selectedOption == index
                      ? quizModel.answer == quizModel.correctAnswer
                          ? Colors.green
                          : Colors.red
                      : null,
                ),
                child: RadioListTile<int?>(
                  value: index,
                  groupValue: selectedOption,
                  onChanged: (value) {},
                  title: Text(
                    quizModel.options[index],
                    style: TextStyle(
                      color:
                          selectedOption == index ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Jawaban benar:",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                const Divider(),
                Text(
                  quizModel.correctAnswer,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            quizModel.number == 1
                ? const SizedBox()
                : ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      "Sebelumnya",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
              ),
              onPressed: () {
                if (quizModel.number == 20) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QuizDonePage(),
                    ),
                    (route) => route.isFirst,
                  );
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ViewQuizPage(
                          quizModel: QuizModel(
                            number: 20,
                            question:
                                "Dalam fotografi, apa yang dimaksud dengan \"eksposur\"?",
                            options: [
                              "Proses mengambil gambar dengan kamera",
                              "Kuantitas cahaya yang mencapai sensor kamera",
                              "Pengaturan kecerahan dan kontras dalam gambar",
                              "Efek visual yang dihasilkan oleh kamera",
                              "Hasil akhir dari pengolahan foto",
                            ],
                            answer:
                                "Kuantitas cahaya yang mencapai sensor kamera",
                            correctAnswer:
                                "Kuantitas cahaya yang mencapai sensor kamera",
                          ),
                        ),
                      ));
                }
              },
              child: Text(
                quizModel.number == 20 ? "Selesaikan" : "Selanjutnya",
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

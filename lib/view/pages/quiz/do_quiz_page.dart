import 'package:flutter/material.dart';

import 'package:pembelajaran_photography/common/images.dart';
import 'package:pembelajaran_photography/model/quiz_model.dart';
import 'package:pembelajaran_photography/view/pages/quiz/quiz_done_page.dart';

class DoQuizPage extends StatefulWidget {
  final QuizModel quizModel;

  const DoQuizPage({
    super.key,
    required this.quizModel,
  });

  @override
  State<DoQuizPage> createState() => _DoQuizPageState();
}

class _DoQuizPageState extends State<DoQuizPage> {
  int? selectedOption;

  @override
  Widget build(BuildContext context) {
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
                Text("${widget.quizModel.number}. "),
                Flexible(
                  child: Text(widget.quizModel.question),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Column(
            children: List.generate(widget.quizModel.options.length, (index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    selectedOption = index;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: selectedOption == index ? Colors.grey : null,
                  ),
                  child: RadioListTile<int?>(
                    value: index,
                    groupValue: selectedOption,
                    onChanged: (value) {
                      setState(() {
                        selectedOption = value;
                      });
                    },
                    title: Text(widget.quizModel.options[index]),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            widget.quizModel.number == 1
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
              onPressed: selectedOption == null
                  ? null
                  : () {
                      if (widget.quizModel.number == 20) {
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
                              builder: (context) => DoQuizPage(
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
                                  correctAnswer:
                                      'Kuantitas cahaya yang mencapai sensor kamera',
                                ),
                              ),
                            ));
                      }
                    },
              child: Text(
                widget.quizModel.number == 20 ? "Selesaikan" : "Selanjutnya",
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

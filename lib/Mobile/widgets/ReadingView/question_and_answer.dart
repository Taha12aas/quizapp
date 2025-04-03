import 'package:flutter/material.dart';
import 'package:quizapp/utils/constants.dart';
import 'package:quizapp/utils/font_style.dart';

class QuestionAndAnswer extends StatefulWidget {
  const QuestionAndAnswer({
    super.key,
    required this.data,
    required this.isIcon,
  });

  final List<dynamic> data;
  final bool isIcon;

  @override
  State<QuestionAndAnswer> createState() => _QuestionAndAnswerState();
}

class _QuestionAndAnswerState extends State<QuestionAndAnswer> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.data.length,
      itemBuilder: (context, index) {
        final questionData = widget.data[index];
        final isEven = index % 2 == 0;

        return Card(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          color: isEven
              ? const Color.fromARGB(255, 32, 35, 52)
              : const Color(0xFF2A2E40),
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Flexible(
                      child: Text(
                        questionData['question'],
                        textAlign: TextAlign.right,
                        style: FontStyleApp.white15.copyWith(
                          color: kWhite,
                        ),
                        softWrap: true,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '- ${index + 1}',
                      style: FontStyleApp.white15.copyWith(
                        color: kOrange,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: questionData['answers'].map<Widget>((answer) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: answer == questionData['question']
                              ? kOrange
                              : const Color(0xFF3A3F54),
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 4,
                              offset: const Offset(2, 2),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            answer,
                            textAlign: TextAlign.right,
                            style: FontStyleApp.white15.copyWith(
                              color: kWhite,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                widget.isIcon
                    ? Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Color(0xFFEE4B2B),
                          ),
                          onPressed: () {
                            setState(() {
                              widget.data.removeAt(index);
                            });
                          },
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        );
      },
    );
  }
}

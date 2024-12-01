import 'package:flutter/material.dart';
import 'package:quizapp/utils/constants.dart';
import 'package:quizapp/utils/font_style.dart';
import 'package:quizapp/utils/responsive_text.dart';

class YearQuestions extends StatelessWidget {
  const YearQuestions({
    super.key,
    required this.year,
  });
  final String year;
  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> valueNotifier = ValueNotifier(false);
    return ValueListenableBuilder(
      valueListenable: valueNotifier,
      builder: (context, value, child) {
        return Container(
          height: MediaQuery.sizeOf(context).height * .06,
          decoration: BoxDecoration(
            color: kAshenColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              const SizedBox(width: 10),
              IconButton(
                onPressed: () {
                  valueNotifier.value = !valueNotifier.value;
                },
                icon: value
                    ? const Icon(
                        Icons.file_download_done,
                        color: Colors.white,
                      )
                    : const Icon(
                        Icons.sim_card_download_sharp,
                        color: Colors.white,
                      ),
              ),
              const Spacer(),
              Text(
                year,
                style: FontStyleApp.snakBarLabel.copyWith(
                  fontSize: getResponsiveText(context, 18),
                ),
              ),
              const SizedBox(width: 20)
            ],
          ),
        );
      },
    );
  }
}

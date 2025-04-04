import 'package:flutter/material.dart';
import 'package:quizapp/utils/constants.dart';
import 'package:quizapp/utils/font_style.dart';
import 'package:quizapp/utils/responsive_text.dart';

class YearQuestions extends StatelessWidget {
  const YearQuestions({
    super.key,
    required this.year,
    required this.session,
  });
  final String year;
  final String session;
  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> valueNotifier = ValueNotifier(false);
    return ValueListenableBuilder(
      valueListenable: valueNotifier,
      builder: (context, value, child) {
        return Container(
          height: MediaQuery.sizeOf(context).height * .07,
          decoration: BoxDecoration(
            color: kAshen,
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
                        color: kWhite,
                      )
                    : const Icon(
                        Icons.download,
                        color: kOrange,
                      ),
              ),
              const Spacer(),
              FittedBox(
                child: Text(
                  session,
                  style: FontStyleApp.white18.copyWith(
                    fontSize: getResponsiveText(context, 18),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              FittedBox(
                child: Text(
                  ': الفصل',
                  style: FontStyleApp.orange10.copyWith(
                    fontSize: getResponsiveText(context, 18),
                  ),
                ),
              ),
              const Spacer(),
              FittedBox(
                child: Text(
                  year,
                  style: FontStyleApp.white18.copyWith(
                    fontSize: getResponsiveText(context, 18),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              FittedBox(
                child: Text(
                  ': السنة',
                  style: FontStyleApp.orange15.copyWith(
                    fontSize: getResponsiveText(context, 18),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              )
            ],
          ),
        );
      },
    );
  }
}

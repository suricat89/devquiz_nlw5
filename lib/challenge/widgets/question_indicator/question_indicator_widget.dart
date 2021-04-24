import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  final int currentPage;
  final int length;
  const QuestionIndicatorWidget({
    Key? key,
    required this.currentPage,
    required this.length,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Questão ${currentPage + 1}", style: AppTextStyles.body),
                Text("de $length", style: AppTextStyles.body),
              ],
            ),
          ),
          SizedBox(height: 16),
          ProgressIndicatorWidget(
            value: (currentPage + 1) / length,
          ),
        ],
      ),
    );
  }
}

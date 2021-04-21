import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/home/widgets/level_button/level_button_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum DifficultyLevel { easy, medium, hard, expert }

class LevelButtonWidget extends StatelessWidget {
  final DifficultyLevel difficultyLevel;

  LevelButtonWidget({
    Key? key,
    required this.difficultyLevel,
  }) : super(key: key);

  final Map<DifficultyLevel, LevelButtonStyle> config = {
    DifficultyLevel.easy: LevelButtonStyle(
        textValue: "Fácil",
        textColor: AppColors.levelButtonFacil,
        borderColor: AppColors.levelButtonBorderFacil,
        fontColor: AppColors.levelButtonTextFacil),
    DifficultyLevel.medium: LevelButtonStyle(
        textValue: "Médio",
        textColor: AppColors.levelButtonMedio,
        borderColor: AppColors.levelButtonBorderMedio,
        fontColor: AppColors.levelButtonTextMedio),
    DifficultyLevel.hard: LevelButtonStyle(
        textValue: "Difícil",
        textColor: AppColors.levelButtonDificil,
        borderColor: AppColors.levelButtonBorderDificil,
        fontColor: AppColors.levelButtonTextDificil),
    DifficultyLevel.expert: LevelButtonStyle(
        textValue: "Perito",
        textColor: AppColors.levelButtonPerito,
        borderColor: AppColors.levelButtonBorderPerito,
        fontColor: AppColors.levelButtonTextPerito),
  };

  String get textValue => config[difficultyLevel]!.textValue;
  Color get color => config[difficultyLevel]!.textColor;
  Color get borderColor => config[difficultyLevel]!.borderColor;
  Color get fontColor => config[difficultyLevel]!.fontColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: color,
            border: Border.fromBorderSide(BorderSide(color: borderColor)),
            borderRadius: BorderRadius.circular(28)),
        margin: const EdgeInsets.only(right: 5),
        width: 80,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                textValue,
                style: GoogleFonts.notoSans(color: fontColor, fontSize: 13),
              ),
            ],
          ),
        ));
  }
}

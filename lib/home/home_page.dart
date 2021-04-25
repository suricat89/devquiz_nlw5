import 'package:devquiz/challenge/challenge_page.dart';
import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/home/home_controller.dart';
import 'package:devquiz/home/home_state.dart';
import 'package:devquiz/home/widgets/app_bar/app_bar_widget.dart';
import 'package:devquiz/home/widgets/level_button/level_button_widget.dart';
import 'package:devquiz/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    super.initState();

    controller.getUser();
    controller.getQuizzes();

    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.success) {
      return Scaffold(
        appBar: AppBarWidget(user: controller.user!),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                clipBehavior: Clip.antiAlias,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Row(
                    children: [
                      LevelButtonWidget(difficultyLevel: DifficultyLevel.easy),
                      LevelButtonWidget(
                          difficultyLevel: DifficultyLevel.medium),
                      LevelButtonWidget(difficultyLevel: DifficultyLevel.hard),
                      LevelButtonWidget(
                          difficultyLevel: DifficultyLevel.expert),
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: StaggeredGridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 13,
                crossAxisSpacing: 13,
                children: controller.quizzes!
                    .map((e) => QuizCardWidget(
                          completed:
                              '${e.questionAnswered} de ${e.questions.length}',
                          title: e.title,
                          percent: e.questionAnswered / e.questions.length,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChallengePage(
                                  questions: e.questions,
                                  title: e.title,
                                ),
                              ),
                            );
                          },
                        ))
                    .toList(),
                staggeredTiles: controller.quizzes!
                    .map(
                      (e) => StaggeredTile.fit(1),
                    )
                    .toList(),
              ))
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
          ),
        ),
      );
    }
  }
}

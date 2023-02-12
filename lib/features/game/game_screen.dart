import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import '../../constants/const.dart';
import 'doodle_dash.dart';
import 'widgets/game_over_overlay.dart';
import 'widgets/game_overlay.dart';
import 'widgets/main_menu_overlay.dart';

final Game game = DoodleDash();

class BrainyGame extends StatefulWidget {
  static const String routeName = '/brainy_game';
  const BrainyGame({super.key});
  @override
  State<BrainyGame> createState() => _BrainyGameState();
}

class _BrainyGameState extends State<BrainyGame> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBlue,
        body: Center(
          child: LayoutBuilder(builder: (context, constraints) {
            return Container(
              constraints: const BoxConstraints(
                maxWidth: 800,
                minWidth: 550,
              ),
              child: GameWidget(
                game: game,
                overlayBuilderMap: <String, Widget Function(BuildContext, Game)>{
                  'gameOverlay': (context, game) => GameOverlay(game),
                  'mainMenuOverlay': (context, game) => MainMenuOverlay(game),
                  'gameOverOverlay': (context, game) => GameOverOverlay(game),
                },
              ),
            );
          }),
        ),
      ),
    );
  }
}

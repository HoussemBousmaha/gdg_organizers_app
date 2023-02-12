// Copyright 2022 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:gdg_organizers_app/constants/const.dart';

import '../doodle_dash.dart';

// Overlay that appears for the main menu
class MainMenuOverlay extends StatefulWidget {
  const MainMenuOverlay(this.game, {super.key});

  final Game game;

  @override
  State<MainMenuOverlay> createState() => _MainMenuOverlayState();
}

class _MainMenuOverlayState extends State<MainMenuOverlay> {
  Character character = Character.dash;

  @override
  Widget build(BuildContext context) {
    DoodleDash game = widget.game as DoodleDash;

    return LayoutBuilder(builder: (context, constraints) {
      final characterWidth = constraints.maxWidth / 5;

      final TextStyle titleStyle = (constraints.maxWidth > 830) ? Theme.of(context).textTheme.displayLarge! : Theme.of(context).textTheme.displaySmall!;

      final bool screenHeightIsSmall = constraints.maxHeight < 760;

      return Material(
        color: kBlue,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Doodle Dash',
                    style: titleStyle.copyWith(height: .8, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  const WhiteSpace(),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Select your character:',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  if (!screenHeightIsSmall) const WhiteSpace(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CharacterButton(
                        character: Character.dash,
                        selected: character == Character.dash,
                        onSelectChar: () {
                          setState(() {
                            character = Character.dash;
                          });
                        },
                        characterWidth: characterWidth,
                      ),
                      CharacterButton(
                        character: Character.brainy,
                        selected: character == Character.brainy,
                        onSelectChar: () {
                          setState(() {
                            character = Character.brainy;
                          });
                        },
                        characterWidth: characterWidth,
                      ),
                    ],
                  ),
                  if (!screenHeightIsSmall) const WhiteSpace(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Difficulty:', style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white)),
                      LevelPicker(
                        level: game.levelManager.selectedLevel.toDouble(),
                        label: game.levelManager.selectedLevel.toString(),
                        onChanged: ((value) {
                          setState(() {
                            game.levelManager.selectLevel(value.toInt());
                          });
                        }),
                      ),
                    ],
                  ),
                  if (!screenHeightIsSmall) const WhiteSpace(height: 50),
                  Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        game.gameManager.selectCharacter(character);
                        game.startGame();
                      },
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(
                          const Size(100, 50),
                        ),
                        backgroundColor: const MaterialStatePropertyAll(Colors.white),
                        textStyle: MaterialStateProperty.all(Theme.of(context).textTheme.titleLarge),
                      ),
                      child: const Text(
                        'Start',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

class LevelPicker extends StatelessWidget {
  const LevelPicker({
    super.key,
    required this.level,
    required this.label,
    required this.onChanged,
  });

  final double level;
  final String label;
  final void Function(double) onChanged;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Slider(
      activeColor: Colors.white,
      inactiveColor: Colors.green,
      value: level,
      max: 5,
      min: 1,
      divisions: 4,
      label: label,
      onChanged: onChanged,
    ));
  }
}

class CharacterButton extends StatelessWidget {
  const CharacterButton({super.key, required this.character, this.selected = false, required this.onSelectChar, required this.characterWidth});

  final Character character;
  final bool selected;
  final void Function() onSelectChar;
  final double characterWidth;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: (selected) ? ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.white)) : null,
      onPressed: onSelectChar,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Image.asset(
              'assets/images/game/${character.name}_center.png',
              height: characterWidth,
              width: characterWidth,
            ),
            const WhiteSpace(height: 18),
            Text(
              character.name,
              style: TextStyle(fontSize: 20, color: selected ? kBlue : Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class WhiteSpace extends StatelessWidget {
  const WhiteSpace({super.key, this.height = 100});

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}

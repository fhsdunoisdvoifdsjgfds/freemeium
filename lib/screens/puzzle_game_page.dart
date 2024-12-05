import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../widgets/dialogg.dart';
import '../widgets/main_btn.dart';
import '../widgets/my_btn.dart';
import '../widgets/score_card.dart';
import '../widgets/text_title.dart';

class PuzzleGamePage extends StatefulWidget {
  const PuzzleGamePage({super.key});

  @override
  State<PuzzleGamePage> createState() => _PuzzleGamePageState();
}

class _PuzzleGamePageState extends State<PuzzleGamePage> {
  final List<int> _tiles = List.generate(15, (index) => index + 1)..add(0);
  int emptyIndex = 15;
  int gameIndex = 1;
  bool isActive = false;

  @override
  void initState() {
    super.initState();
    _shuffle();
  }

  void _shuffle() {
    final rand = Random();
    for (var i = _tiles.length - 1; i > 0; i--) {
      final j = rand.nextInt(i + 1);
      final temp = _tiles[i];
      _tiles[i] = _tiles[j];
      _tiles[j] = temp;
    }
    emptyIndex = _tiles.indexOf(0);
  }

  void _moveTile(int index) {
    final emptyRow = emptyIndex ~/ 4;
    final emptyCol = emptyIndex % 4;
    final targetRow = index ~/ 4;
    final targetCol = index % 4;

    if ((emptyRow == targetRow && (emptyCol - targetCol).abs() == 1) ||
        (emptyCol == targetCol && (emptyRow - targetRow).abs() == 1)) {
      setState(() {
        _tiles[emptyIndex] = _tiles[index];
        _tiles[index] = 0;
        emptyIndex = index;
        _checkWinCondition();
      });
    }
  }

  void _checkWinCondition() async {
    final winningTiles = List.generate(15, (index) => index + 1)..add(0);
    if (listEquals(_tiles, winningTiles)) {
      if (gameIndex == 4) {
        await showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return Dialogg(
              title: 'You win!',
              onlyClose: true,
              onPressed: () {},
            );
          },
        ).then((value) {
          if (mounted) Navigator.pop(context);
        });
      } else {
        setState(() {
          isActive = true;
        });
      }
    }
  }

  String getImage(int id) {
    if (gameIndex == 1) return 'assets/g$id.png';
    if (gameIndex == 2) return 'assets/gg$id.png';
    if (gameIndex == 3) return 'assets/ggg$id.png';
    if (gameIndex == 4) return 'assets/gggg$id.png';
    return 'assets/g$id.png';
  }

  @override
  Widget build(BuildContext context) {
    final containerSize = MediaQuery.of(context).size.width - 40;
    final tileSize = (containerSize - 14) / 4 + 4;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).viewPadding.top),
          const SizedBox(
            height: 60,
            child: TextTitle('The puzzle master', back: true),
          ),
          const SizedBox(height: 4),
          const ScoreCard(),
          const Spacer(),
          Center(
            child: SizedBox(
              width: containerSize,
              height: containerSize,
              child: Stack(
                children: List.generate(16, (index) {
                  final tile = _tiles[index];
                  final row = index ~/ 4;
                  final col = index % 4;

                  if (tile == 0) return const SizedBox.shrink();

                  return AnimatedPositioned(
                    left: col * tileSize,
                    top: row * tileSize,
                    duration: const Duration(milliseconds: 300),
                    child: MyBtn(
                      onPressed: () => _moveTile(index),
                      child: Container(
                        width: tileSize,
                        height: tileSize,
                        padding: const EdgeInsets.all(5),
                        child: tile > 0 ? Image.asset(getImage(tile)) : null,
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          const Spacer(),
          MainBtn(
            title: 'Next',
            isActive: isActive,
            onPressed: () {
              setState(() {
                gameIndex++;
                _shuffle();
              });
            },
          ),
          const SizedBox(height: 96),
        ],
      ),
    );
  }
}

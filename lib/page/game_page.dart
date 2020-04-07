import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wuziqi_flutter/game_data.dart';
import 'package:wuziqi_flutter/painter/checkerboard_painter.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  var checkerboard = [
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
      ),
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
              height: GameData.topMargin,
              margin: EdgeInsets.only(bottom: 5.0),
              decoration: BoxDecoration(color: Colors.amber),
              child: Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    GameData.reset();
                    setState(() {});
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text(
                      '重置棋盘',
                      style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.none,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTapDown: (TapDownDetails d) {
                print("gameover ${GameData.gameOver}");
                if (!GameData.gameOver) {
                  GameData.addPiece(d.localPosition);
                  setState(() {});
                }
              },
              child: Center(
                child: CustomPaint(
                  size: Size(330, 330),
                  painter: Checkerboard(horizontalCount: 11, verticalCount: 11),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

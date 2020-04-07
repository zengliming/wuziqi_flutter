import 'package:flutter/material.dart';
import 'package:wuziqi_flutter/game_data.dart';

class Checkerboard extends CustomPainter {
  final int horizontalCount;

  final int verticalCount;

  Checkerboard({this.horizontalCount, this.verticalCount});

  @override
  void paint(Canvas canvas, Size size) {
    double eWidth = size.width / horizontalCount;
    double eHeight = size.height / verticalCount;
    /*画棋盘背景*/
    var paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke
      ..color = Color(0x77cdb175); /*背景颜色*/

    canvas.drawRect(Offset.zero & size, paint);

    /*画棋盘网格*/
    paint
      ..style = PaintingStyle.stroke
      ..color = Colors.black
      ..strokeWidth = 1.0;

    //记录横竖线所有的交叉点
    if (GameData.pieces.isEmpty) {
      for (int i = 0; i <= horizontalCount; i++) {
        List<Piece> list = List();
        for (int j = 0; j <= verticalCount; j++) {
          list.add(Piece(eWidth * i, eHeight * j, null, false));
        }
        GameData.pieces.add(list);
      }
    }

    for (int i = 0; i <= verticalCount; i++) {
      double dy = eHeight * i;
      canvas.drawLine(Offset(0, dy), Offset(size.width, dy), paint);
    }
    for (int i = 0; i <= horizontalCount; i++) {
      double dx = eWidth * i;
      canvas.drawLine(Offset(dx, 0), Offset(dx, size.height), paint);
    }

    paint..style = PaintingStyle.fill;
    for (int i = 0; i <= horizontalCount; i++) {
      for (int j = 0; j <= verticalCount; j++) {
        Piece piece = GameData.pieces[i][j];
        if (piece.exist) {
          paint..color = piece.color;
          canvas.drawCircle(Offset(piece.x, piece.y), eWidth / 3, paint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

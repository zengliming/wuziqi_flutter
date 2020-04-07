import 'dart:ui';

import 'package:flutter/material.dart';

class GameData {
  // 棋盘焦点
  static List<CrossNode> crossNodes = List();

  // 白色棋子数据
  static List<Piece> whitePieces = List();

  // 黑色棋子数据
  static List<Piece> blackPieces = List();

  static List<Piece> pieces = List();

  static Size size = Size(330, 330);

  static double topMargin = 200.0;

  // 0是黑棋
  static bool isBlack = true;

  static double horizontalMargin =
      (window.physicalSize.width / window.devicePixelRatio - size.width) / 2;

  static void addPiece(Offset offset) {
    Offset realOffset =
        Offset(offset.dx - GameData.horizontalMargin, offset.dy);
    for (int i = 0; i < GameData.crossNodes.length; i++) {
      CrossNode node = GameData.crossNodes[i];
      if (!node.isExistPiece) {
        double distance = (node.x - realOffset.dx) * (node.x - realOffset.dx) +
            (node.y - realOffset.dy) * (node.y - realOffset.dy);
        if (distance < 25 && !node.isExistPiece) {
          Color color = isBlack ? Colors.black : Colors.white;
          pieces.add(Piece(node.x, node.y, color));
          GameData.crossNodes[i].isExistPiece = true;
          isBlack = !isBlack;
          return;
        }
      }
    }
  }
}

class Piece {
  double x;
  double y;
  Color color;

  Piece(this.x, this.y, this.color);

  @override
  String toString() {
    return 'Piece{x: $x, y: $y, color: $color}';
  }
}

class CrossNode {
  double x;
  double y;
  bool isExistPiece;

  CrossNode(this.x, this.y, this.isExistPiece);

  @override
  String toString() {
    return 'CrossNode{x: $x, y: $y, isExistPiece: $isExistPiece}';
  }
}

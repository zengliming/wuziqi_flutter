import 'dart:ui';

import 'package:flutter/material.dart';

class GameData {
  static List<List<Piece>> pieces = List();

  static Size size = Size(330, 330);

  static double topMargin = 200.0;

  // 0是黑棋
  static bool isBlack = true;

  static bool gameOver = false;

  static double horizontalMargin =
      (window.physicalSize.width / window.devicePixelRatio - size.width) / 2;

  static void addPiece(Offset offset) {
    Offset realOffset =
        Offset(offset.dx - GameData.horizontalMargin, offset.dy);
    for (int i = 0; i < GameData.pieces.length; i++) {
      for (int j = 0; j < GameData.pieces[0].length; j++) {
        Piece node = GameData.pieces[i][j];
        if (!node.exist) {
          double distance =
              (node.x - realOffset.dx) * (node.x - realOffset.dx) +
                  (node.y - realOffset.dy) * (node.y - realOffset.dy);
          if (distance < 25 && !node.exist) {
            Color color = isBlack ? Colors.black : Colors.white;
            GameData.pieces[i][j].exist = true;
            GameData.pieces[i][j].color = color;
            bool result = judgeVictory();
            if (result) {
              GameData.gameOver = true;
            }
            GameData.isBlack = !GameData.isBlack;
            return;
          }
        }
      }
    }
  }

  static Piece ai() {
    num score;
    Piece piece;
    for (int i = 0; i < GameData.pieces.length; i++) {
      for (int j = 0; j < GameData.pieces[0].length; j++) {
        piece = GameData.pieces[i][j];
        if (GameData.pieces[i][j].color == Colors.black) {
          for (int k = 0; k < 4; k++) {
            if (j + k >= GameData.pieces[0].length) {
              break;
            }
          }
        }
      }
    }
    return piece;
  }

  static num verticallyScore() {
    num score;
    for (int i = 0; i < GameData.pieces.length; i++) {
      for (int j = 0; j < GameData.pieces[0].length; j++) {
        if (GameData.pieces[i][j].color == Colors.black) {
          for (int k = 0; k < 4; k++) {
            if (j + k >= GameData.pieces[0].length) {
              break;
            }
          }
        }
      }
    }
    return score;
  }

  static bool judgeVictory() {
    bool result = false;
    // 当前下棋的是黑棋
    Color judgeColor = GameData.isBlack ? Colors.black : Colors.white;
    for (int i = 0; i < GameData.pieces.length; i++) {
      for (int j = 0; j < GameData.pieces[0].length; j++) {
        Piece piece = GameData.pieces[i][j];
        if (piece.exist && judgeColor == piece.color) {
          result = judgeHorizontal(i, j, judgeColor);
          if (result) {
            print("win");
            return result;
          }
          result = judgeVertical(i, j, judgeColor);
          if (result) {
            print("win");
            return result;
          }

          result = judgeDiagonal(i, j, judgeColor);
          if (result) {
            print("win");
            return result;
          }
        }
      }
    }
    return result;
  }

  static bool judgeHorizontal(int i, int j, Color color) {
    if (GameData.pieces.length - i < 5) {
      return false;
    }
    for (int k = 1; k <= 4; k++) {
      Piece piece = GameData.pieces[i + k][j];
      if (!piece.exist || color != piece.color) {
        return false;
      }
    }
    return true;
  }

  static bool judgeVertical(int i, int j, Color color) {
    if (GameData.pieces[0].length - j < 5) {
      return false;
    }
    for (int k = 1; k <= 4; k++) {
      Piece piece = GameData.pieces[i][j + k];
      if (!piece.exist || color != piece.color) {
        return false;
      }
    }
    return true;
  }

  static bool judgeDiagonal(int i, int j, Color color) {
    if (GameData.pieces[0].length - j < 5 || GameData.pieces.length - i < 5) {
      return false;
    }
    for (int k = 1; k <= 4; k++) {
      Piece piece = GameData.pieces[i + k][j + k];
      if (!piece.exist || color != piece.color) {
        return false;
      }
    }
    return true;
  }

  static void reset() {
    for (int i = 0; i < GameData.pieces.length; i++) {
      for (int j = 0; j < GameData.pieces[0].length; j++) {
        Piece piece = GameData.pieces[i][j];
        if (piece.exist) {
          GameData.pieces[i][j].exist = false;
          GameData.pieces[i][j].color = null;
        }
      }
    }
    GameData.gameOver = false;
  }
}

class Piece {
  // 水平坐标
  double x;

  // 垂直坐标
  double y;

  // 颜色
  Color color;

  // 是否是存在的
  bool exist;

  Piece(this.x, this.y, this.color, this.exist);

  @override
  String toString() {
    return 'Piece{x: $x, y: $y, color: $color, exist: $exist}';
  }
}

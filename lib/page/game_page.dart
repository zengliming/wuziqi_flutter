import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wuziqi_flutter/game_data.dart';
import 'package:wuziqi_flutter/painter/checkerboard_painter.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {


  @override
  void setState(fn) {
    if(mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    // 设置状态栏颜色和样式
    var style = SystemUiOverlayStyle.light.copyWith(
      // 状态栏颜色
      statusBarColor: Colors.lightBlueAccent,
    );
    SystemChrome.setSystemUIOverlayStyle(style);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Scaffold(
        appBar: _appBar(),
        body: _body(),
      ),
    );
  }
  // appbar
  _appBar() {
    return AppBar(
      backgroundColor: Colors.lightBlueAccent,
      title: Text(
        '五子棋',
      ),
      centerTitle: true,
    );
  }

  _body() {
    return Container(
      margin: EdgeInsets.only(
        top: 100.0,
      ),
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTapDown: (TapDownDetails d) {
              // 添加旗子
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
          ),
          _resetButton(),
        ],
      ),
    );
  }

  // 重置按钮
  _resetButton() {
    return Container(
      height: 40.0,
      width: 80.0,
      margin: EdgeInsets.only(
        top: 60,
        bottom: 5.0,
      ),
      child: RaisedButton(
        color: Colors.lightBlueAccent,
        disabledColor: Colors.grey,
        onPressed: !GameData.gameOver
            ? null
            : () {
                GameData.reset();
                setState(() {});
              },
        child: Text(
          '重置',
        ),
      ),
    );
  }
}

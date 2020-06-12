import 'package:flutter/material.dart';
import 'package:wuziqi_flutter/page/game_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '五子棋',
      debugShowCheckedModeBanner: false,
      home: GamePage(),
    );
  }
}

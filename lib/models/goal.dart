import 'package:flutter/material.dart';

class Goal {
  Goal({
    @required this.id,
    this.content, // 목표 내용
    this.dueDate, // 기한
    this.colorIdx, // 색상
    this.firstDue,
    this.failCount = 0,
  });
  String id;
  String content;
  DateTime dueDate;
  int colorIdx;
  DateTime firstDue;
  int failCount;
}

class HexColor extends Color {
  static List<Color> colorList = [
    Colors.grey,
    Color(0xFFE7E746),
    Color(0xFF3997EA),
  ];

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

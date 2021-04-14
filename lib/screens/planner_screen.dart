import 'package:flutter/material.dart';

import '../categories/all.dart';

class PlannerScreen extends StatefulWidget {
  static const routeName = '/planner_screen';

  @override
  _PlannerScreenState createState() => _PlannerScreenState();
}

class _PlannerScreenState extends State<PlannerScreen> {
  int selectedStyle = 0;

  final List<Widget> bodyStyles = [
    ALL(),
    Center(
      child: Text('hi'),
    )
  ];

  Widget categoryButtons() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        categoryButton('ALL', 0),
        categoryButton('DAY', 1),
        categoryButton('MONTH', 2),
        categoryButton('YEAR', 3),
      ],
    );
  }

  Widget categoryButton(String text, int idx) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedStyle = idx;
        });
      },
      child: Container(
        child: Center(
          child: Text(text),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: categoryButtons(),
        actions: [
          IconButton(
            onPressed: null,
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: bodyStyles[selectedStyle],
    );
  }
}

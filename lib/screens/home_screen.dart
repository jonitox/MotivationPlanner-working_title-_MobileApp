import 'package:flutter/material.dart';

import './planner_screen.dart';

class HomeScreen extends StatelessWidget {
  Widget itemButton(BuildContext ctx, String text, int idx) {
    return ElevatedButton(
      onPressed: () {
        if (idx == 0) {
          Navigator.of(ctx).pushNamed(PlannerScreen.routeName);
        }
      },
      child: Text(text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            itemButton(context, '계획 세우기', 0),
            itemButton(context, '성과 보기', 1),
          ],
        ),
      ),
    );
  }
}

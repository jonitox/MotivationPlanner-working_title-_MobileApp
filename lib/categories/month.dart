import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../providers/goals.dart';

import '../models/goal.dart';

class MonthStyle extends StatelessWidget {
  final CarouselController buttonCarouselController = CarouselController();

  Widget monthBox(int month, List<Goal> goals) {
    List<Widget> goalsColumn = [];
    goals.forEach((g) {
      goalsColumn.add(Text(g.content));
    });
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.grey),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('$month월'),
          ...goalsColumn,
        ],
      ),
    );
  }

  Widget yearPage(int year, Map<int, List<Goal>> goals) {
    List<Widget> gridBoxes = [];
    for (int month = 1; month <= 12; ++month) {
      gridBoxes
          .add(monthBox(month, goals.containsKey(month) ? goals[month] : []));
    }

    return Column(
      children: [
        Text('$year년'),
        Expanded(
          child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
            ),
            children: gridBoxes,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final monthlyGoalsByYear =
        Provider.of<Goals>(context).getMonthlyGoalsGroupedByYear;
    final deviceSize = MediaQuery.of(context).size;
    final thisYear = DateTime.now().year;

    return PageView.builder(
        itemCount: 100,
        itemBuilder: (ctx, i) => yearPage(
            thisYear + i,
            monthlyGoalsByYear.containsKey(thisYear + i)
                ? monthlyGoalsByYear[thisYear + i]
                : {}));
  }
}

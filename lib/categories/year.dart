import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/goal.dart';

import '../providers/goals.dart';

class YearStyle extends StatelessWidget {
  Widget yearGoalBox(int year, List<Goal> goals) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.grey),
      ], borderRadius: BorderRadius.circular(10), color: Colors.white),
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(3),
      child: Column(
        children: [
          Text('$year'),
          if (goals.length > 0) Text('${goals[0].content}'),
          if (goals.length > 1) Text('${goals[1].content}'),
          if (goals.length > 2) Text('${goals[2].content}'),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final yearlyGoals = Provider.of<Goals>(context).getYearlyGoals;
    final deviceSize = MediaQuery.of(context).size;
    final thisYear = DateTime.now().year;

    return GridView.builder(
      key: PageStorageKey<String>("allview"),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        crossAxisSpacing: deviceSize.width * 0.01,
        mainAxisSpacing: deviceSize.height * 0.01,
      ),
      itemCount: 100,
      itemBuilder: (ctx, i) => yearGoalBox(
          thisYear + i,
          yearlyGoals.containsKey(thisYear + i)
              ? yearlyGoals[thisYear + i]
              : []),
    );
  }
}

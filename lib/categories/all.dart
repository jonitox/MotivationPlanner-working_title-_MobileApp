import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/goals.dart';

import '../models/goal.dart';

class AllStyle extends StatefulWidget {
  @override
  _ALLState createState() => _ALLState();
}

class _ALLState extends State<AllStyle>
    with AutomaticKeepAliveClientMixin<AllStyle> {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

  Widget goalBox(Goal goal) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.grey),
          ],
          borderRadius: BorderRadius.circular(10),
          color: HexColor.colorList[goal.colorIdx]),
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(3),
      child: Column(
        children: [
          Text("D-${goal.dueDate.difference(DateTime.now()).inDays}"), // d-day
          Text(goal.dueDate.toString()), // 기한
          Text(goal.content), // 내용
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final goalList = Provider.of<Goals>(context).items;
    final deviceSize = MediaQuery.of(context).size;
    return GridView.builder(
      key: PageStorageKey<String>("allview"),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.8,
        crossAxisSpacing: deviceSize.width * 0.01,
        mainAxisSpacing: deviceSize.height * 0.01,
      ),
      itemCount: goalList.length,
      itemBuilder: (ctx, i) => goalBox(goalList[i]),
    );
  }
}

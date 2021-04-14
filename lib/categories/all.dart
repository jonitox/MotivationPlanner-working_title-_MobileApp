import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/goals.dart';

import '../models/goal.dart';

class ALL extends StatefulWidget {
  @override
  _ALLState createState() => _ALLState();
}

class _ALLState extends State<ALL> with AutomaticKeepAliveClientMixin<ALL> {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    print('init!');
    super.initState();
  }

  Widget goalBox(Goal goal) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: HexColor.colorList[goal.colorIdx]),
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          Text(goal.dueDate.toString()),
          Text(goal.content),
        ],
      ),
    );
  }

  bool tag = false;
  @override
  Widget build(BuildContext context) {
    final goals = Provider.of<Goals>(context).items;

    return Column(
      children: [
        ElevatedButton(
            onPressed: () {
              setState(() {
                print(tag);
                tag = !tag;
              });
            },
            child: Text('클릭!')),
        Container(
          height: 100,
          width: 100,
          color: tag ? Colors.blue : Colors.red,
        )
      ],
    );

    // return GridView.builder(
    //   gridDelegate:
    //       SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
    //   itemCount: goals.length,
    //   itemBuilder: (ctx, i) => goalBox(goals[i]),
    // );
  }
}

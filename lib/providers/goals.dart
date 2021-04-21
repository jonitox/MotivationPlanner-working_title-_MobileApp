import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

import '../models/goal.dart';

class Goals with ChangeNotifier {
  List<Goal> _items = [
    Goal(
      id: '1',
      content: '어플 완성하기',
      dueDate: DateTime(2021, 4, 25, 12, 0),
      colorIdx: 0,
    ),
    Goal(
      id: '2',
      content: '영어 회화배우기',
      dueDate: DateTime(2021, 4, 25, 18, 0),
      colorIdx: 1,
    ),
    Goal(
      id: '3',
      content: '시차 바꾸기',
      dueDate: DateTime(2021, 5, 10, 12, 00),
      colorIdx: 2,
    ),
    Goal(
      id: '4',
      content: '시차 바꾸기',
      dueDate: DateTime(2021, 5, 14, 14, 00),
      colorIdx: 1,
    ),
  ];

  List<Goal> get items {
    return [..._items];
  }

  List<Goal> get getSortedByDate {
    List<Goal> ret = [...items];
    ret.sort((a, b) => a.dueDate.isBefore(b.dueDate) ? -1 : 1);
    return ret;
  }

  Map<int, Map<int, List<Goal>>> get monthlyGoalsGroupedByYear {
    Map<int, Map<int, List<Goal>>> ret = {};
    _items.forEach((g) {
      int year = g.dueDate.year;
      int month = g.dueDate.month;
      if (!ret.containsKey(year)) {
        ret[year] = {};
      }
      if (!ret[year].containsKey(month)) {
        ret[year][month] = [];
      }
      ret[year][month].add(g);
    });

    return ret;
  }
}

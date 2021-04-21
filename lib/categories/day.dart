import 'package:demo_planner/models/goal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../providers/goals.dart';
import '../models/goal.dart';

class DayStyle extends StatefulWidget {
  DayStyle(Key key) : super(key: key);
  @override
  _DayStyleState createState() => _DayStyleState();
}

class _DayStyleState extends State<DayStyle> {
  final CalendarController _calendarController = CalendarController();
  GoalDataSource data;
  List<Goal> goals;
  @override
  void initState() {
    _calendarController.selectedDate = DateTime.now();
    super.initState();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    goals = Provider.of<Goals>(context).items;
    data = GoalDataSource(goals);
    return SfCalendar(
      key: PageStorageKey<String>("calendar"),
      view: CalendarView.month,
      controller: _calendarController,
      headerDateFormat: "y년 M월",
      initialSelectedDate: DateTime.now(),
      appointmentBuilder: (_, detail) {
        final Goal goal = detail.appointments.first;
        return Container(
          color: HexColor.colorList[goal.colorIdx],
          child: Text(goal.content),
        );
      },
      onViewChanged: null,
      dataSource: data,
      monthViewSettings: MonthViewSettings(
        showAgenda: true,
      ),
      timeSlotViewSettings: TimeSlotViewSettings(
          minimumAppointmentDuration: const Duration(minutes: 60)),
    );
  }
}

class GoalDataSource extends CalendarDataSource {
  GoalDataSource(this.source);

  List<Goal> source;

  @override
  List<Goal> get appointments => source;

  @override
  DateTime getStartTime(int index) {
    return source[index].dueDate;
  }

  @override
  DateTime getEndTime(int index) {
    return source[index].dueDate;
  }

  @override
  bool isAllDay(int index) {
    return false;
  }

  @override
  String getSubject(int index) {
    return source[index].content;
  }

  @override
  Color getColor(int index) {
    return HexColor.colorList[source[index].colorIdx];
  }
}

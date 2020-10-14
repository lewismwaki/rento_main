// All Dates
class Dates {
  List<MonthsClass> monthsList;
  List<WeekDaysClass> weekDaysList;

  Dates({this.monthsList, this.weekDaysList});
}

//----------------weekdays-----------------

class WeekDaysClass {
  String weekDayName;
  String fullWeekDayName;
  WeekDaysClass({this.weekDayName, this.fullWeekDayName});
}

List<WeekDaysClass> weekDaysList = [
  WeekDaysClass(
    weekDayName: 'Sun',
    fullWeekDayName: 'Sunday',
  ),
  WeekDaysClass(
    weekDayName: 'Mon',
    fullWeekDayName: 'Monday',
  ),
  WeekDaysClass(
    weekDayName: 'Tue',
    fullWeekDayName: 'Tuesday',
  ),
  WeekDaysClass(
    weekDayName: 'Wed',
    fullWeekDayName: 'Wednesday',
  ),
  WeekDaysClass(
    weekDayName: 'Thu',
    fullWeekDayName: 'Thursday',
  ),
  WeekDaysClass(
    weekDayName: 'Fri',
    fullWeekDayName: 'Friday',
  ),
  WeekDaysClass(
    weekDayName: 'Sat',
    fullWeekDayName: 'Saturday',
  ),
  WeekDaysClass(
    weekDayName: 'Sun',
    fullWeekDayName: 'Sunday',
  ),
];

//----------------months-----------------
class MonthsClass {
  String monthName;
  MonthsClass({this.monthName});
}

List<MonthsClass> monthsList = [
  MonthsClass(
    monthName: 'null',
  ),
  MonthsClass(
    monthName: 'Jan',
  ),
  MonthsClass(
    monthName: 'Feb',
  ),
  MonthsClass(
    monthName: 'Mar',
  ),
  MonthsClass(
    monthName: 'Apr',
  ),
  MonthsClass(
    monthName: 'May',
  ),
  MonthsClass(
    monthName: 'Jun',
  ),
  MonthsClass(
    monthName: 'Jul',
  ),
  MonthsClass(
    monthName: 'Aug',
  ),
  MonthsClass(
    monthName: 'Sep',
  ),
  MonthsClass(
    monthName: 'Oct',
  ),
  MonthsClass(
    monthName: 'Nov',
  ),
  MonthsClass(
    monthName: 'Dec',
  ),
];

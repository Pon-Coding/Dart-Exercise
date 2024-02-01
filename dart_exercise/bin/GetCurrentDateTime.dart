String get getMyCurrentDate {
  DateTime now = DateTime.now();
  int day = now.day;
  String month = now.month.toString();
  int year = now.year;
  int hour = now.hour;
  int minute = now.minute;
  return '$day/$month/$year $hour:$minute';
}
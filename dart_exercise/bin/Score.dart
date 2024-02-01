import 'dart:io';
class Score {
  late double khmer;
  late double math;
  Score({this.khmer = 0.0, this.math = 0.0});

  void Output() {
    print("SUBJECT, KHMER SCORE : $khmer");
    print("SUBJECT, MATH SCORE  : $math");
  }

  String getGrade({required double totalAvg}) {
    return totalAvg <= 25
        ? "Poor".toUpperCase()
        : totalAvg <= 50
            ? "Fair".toUpperCase()
            : totalAvg <= 75
                ? "Good".toUpperCase()
                : "Excellent".toUpperCase();
  }
}

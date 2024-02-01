import 'dart:io';
import 'Score.dart';

void main(List<String> arguments) {
  List<Score> obj = [
    Score(khmer: 10,math: 12.5),
    Score(khmer: 12,math: 77.5),
    Score(khmer: 50,math: 19.5),
    Score(khmer: 80,math: 93.5),
  ];
  for(int i=0; i<obj.length; i++){
    print("Details :");
    obj[i].Output();
    print("\nTHE AVERAGE OF SCORE : ${(obj[i].khmer + obj[i].math) / 2}");
    print("Rank : ${obj[i].getGrade(totalAvg: (obj[i].khmer + obj[i].math) / 2)}");
    print("============================\n");
  }
}


import 'dart:io';
import 'Score.dart';
void main(List<String> args) {
  List<NewScore> obj = [
    NewScore(khmer: 12, math: 32,name: "Pon"),
    NewScore(khmer: 32, math: 65,name: "Pon"),
    NewScore(khmer: 74, math: 76,name: "Pon"),
    NewScore(khmer: 34, math: 87,name: "Pon"),
    NewScore(khmer: 99, math: 45,name: "Pon"),
  ];

  for(int i=0; i<obj.length; i++){
    obj[i].Output();
    print("\nThe Average Of Score : ${(obj[i].khmer + obj[i].math) / 2}".toUpperCase());
    print("Rank : ${obj[i].getGrade(totalAvg: (obj[i].khmer + obj[i].math) / 2)}");
    print("============================\n");
  }
}
class NewScore extends Score{
  late String name;
  NewScore({this.name = "",required double khmer,required double math}):super(khmer: khmer,math: math);
  @override
  void Output(){
    print("$name's Details");
    super.Output();
  }
}
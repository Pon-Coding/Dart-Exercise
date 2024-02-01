//Color Functions
void PrintRed({required String YourText}){
  print("\x1B[31m$YourText\x1B[0m");
}

void PrintWhite({required String YourText}){
  print("\x1B[37m$YourText\x1B[0m");
}
void PrintYellow({required String YourText}){
  print("\x1B[33m$YourText\x1B[0m");
}

void PrintGreen({required String YourText}){
  print("\x1B[32m$YourText\x1B[0m");
}

void PrintCryan({required String YourText}){
  print("\x1B[36m$YourText\x1B[0m");
}
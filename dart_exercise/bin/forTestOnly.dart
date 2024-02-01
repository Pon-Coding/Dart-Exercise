void main() {
  String word = "Messi";

// Create a list to store the indexes of all the "o"s
  List<int> oIndexes = [];

// Iterate over the string and add the index of each "o" to the list
  for (int i = 0; i < word.length; i++) {
    if (word[i] == "s") {
      oIndexes.add(i);
    }
  }

// Print the characters at the specified indexes
  for (int i = 0; i < oIndexes.length; i++) {
    print(word[oIndexes[i]]);
  }
}

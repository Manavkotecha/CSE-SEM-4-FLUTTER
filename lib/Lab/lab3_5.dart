import 'dart:io';

void main() {
  print("Enter a string:");
  String s = stdin.readLineSync()!;
  String reversed = s.split('').reversed.join('');
  print("Reversed string: $reversed");
}

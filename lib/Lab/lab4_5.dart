// WAP to count number of even or odd number from an array of n numbers.
import 'dart:io';
int countEvenOdd(List<int> numbers, {bool even = true}) {
  return numbers.where((num) => (num % 2 == 0) == even).length;
}

void main() {
  print("Enter numbers separated by spaces:");
  List<int> nums = stdin.readLineSync()!.split(' ').map(int.parse).toList();

  int evenCount = countEvenOdd(nums);
  int oddCount = countEvenOdd(nums, even: false);

  print("Number of even numbers: $evenCount");
  print("Number of odd numbers: $oddCount");
}


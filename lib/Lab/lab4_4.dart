// WAP to accept a number and check whether the number is prime or not. Use method name
// check (int n). The method returns 1, if the number is prime otherwise, it returns 0.
import 'dart:io';

int check(int n) {
  if (n < 2) return 0;
  for (int i = 2; i <= n ~/ 2; i++) {
    if (n % i == 0) return 0;
  }
  return 1;
}

void main() {
  print("Enter a number:");
  int num = int.parse(stdin.readLineSync()!);

  if (check(num) == 1) {
    print("$num is a prime number.");
  } else {
    print("$num is not a prime number.");
  }
}

// WAP to generate Fibonacci series of N given number using method.
import 'dart:io';
List<int> generateFibonacci(int n) {
  List<int> fibSeries = [0, 1];
  for (int i = 2; i < n; i++) {
    fibSeries.add(fibSeries[i - 1] + fibSeries[i - 2]);
  }
  return fibSeries.sublist(0, n);
}

void main() {
  print("Enter the number of terms for Fibonacci series:");
  int n = int.parse(stdin.readLineSync()!);

  print("Fibonacci series: ${generateFibonacci(n)}");
}

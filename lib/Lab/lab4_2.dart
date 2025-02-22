// WAP to find maximum number from given two numbers using method.
import 'dart:io';

void main() {
  print("Enter num1:");
  int num1 = int.parse(stdin.readLineSync()!);

  print("Enter num2:");
  int num2 = int.parse(stdin.readLineSync()!);

  max(10,10);
}
void max(int num1,int num2){
  if(num1 > num2){
    print("num1 is largest");
  }
  else{
    print("num2is largest");
  }
}

void max2({ required num1,int num2 = 10}){
  if(num1 > num2){
    print("num1 is largest");
  }
  else{
    print("num2is largest");
  }
}
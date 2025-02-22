// WAP to calculate simple interest using method
import 'dart:io';

void main() {
  print("Enter p:");
  int p = int.parse(stdin.readLineSync()!);

  print("Enter r:");
  int r = int.parse(stdin.readLineSync()!);

  print("Enter t:");
  int t = int.parse(stdin.readLineSync()!);

  intrest(100,100,100);
}
void intrest(int p,int r , int t){
  print((p*r*t)/100);
}
void named({ required p,int r=1,int t =1}){
print((p*r*t)/100);
}
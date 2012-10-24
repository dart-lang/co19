#library("lib");
#import("2_Factories_A01_t01.dart", prefix:"test");

// References a factory class in another library
abstract class A {
  factory A () { return new test.AImpl(); }
  factory A.named() {return new test.AImpl();}
  int methodA();
}

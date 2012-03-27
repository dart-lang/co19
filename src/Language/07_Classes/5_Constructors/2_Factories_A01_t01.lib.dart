#library("lib");
#import("2_Factories_A01_t01.dart", prefix:"test");

// References a factory class in another library
interface A default test.ADef {
 A();
  A.named();
 int methodA();
}

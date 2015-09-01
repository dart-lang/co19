library lib;
import "syntax_t01.dart" as test;

// References a factory class in another library
abstract class A {
  factory A () { return new test.AImpl(); }
  factory A.named() {return new test.AImpl();}
  int methodA();
}

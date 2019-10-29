
abstract class A {
  int test_nullable(int i);
}

abstract class B {
  num test_nullable(num i);
}

class A1 implements B, A {
  int test_nullable(int i) => 2;
}

main() {
  A1();
}

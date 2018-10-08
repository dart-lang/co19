/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of a double valued integer literal is [double]
 * @description Checks that it is a compile error if integer but not a literal
 * is assigned to double local variable
 * @author sgrekhov@unipro.ru
 */
int init() => 42;

class C {

  static void staticMethod() {
    double s1 = init();     //# 01: compile-time error
    double s2 = null;       //# 02: compile-time error
    s2 ??= init();          //# 02: compile-time error
  }

  void instanceMethod() {
    double m1 = init();     //# 03: compile-time error
    double m2 = null;       //# 04: compile-time error
    m2 ??= init();          //# 04: compile-time error
  }
}

void foo() {
  double l1 = init();       //# 05: compile-time error
  double l2 = null;         //# 06: compile-time error
  l2 ??= init();            //# 06: compile-time error
}

main() {
  double d1 = init();       //# 07: compile-time error
  double d2 = null;         //# 08: compile-time error
  d2 ??= init();            //# 08: compile-time error


  void bar() {
    double b1 = init();     //# 09: compile-time error
    double b2 = null;       //# 10: compile-time error
    b2 ??= init();          //# 10: compile-time error
  }

  foo();
  bar();
  C.staticMethod();
  new C().instanceMethod();
}

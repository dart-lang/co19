/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of a double valued integer literal is [double]
 * @description Checks that the static type of a double valued integer literal
 * is [double]. Test local variable assignment
 * @author sgrekhov@unipro.ru
 */

class C {

  static void staticMethod() {
    double s1 = 42;
    double s2 = (1 > 0 ? 42 : 3.14);
    double s3 = (null ?? 42);
    const double s4 = -42;
    final double s5 = 23;

    s1 = -42;
    s1 = null;
    s1 ??= 42;
    s1 ??= -42;
  }

  void instanceMethod() {
    double m1 = 42;
    double m2 = (1 > 0 ? 42 : 3.14);
    double m3 = (null ?? 42);
    const double m4 = -42;
    final double m5 = 23;

    m1 = -42;
    m1 = null;
    m1 ??= 42;
    m1 ??= -42;
  }
}

void foo() {
  double l1 = 42;
  double l2 = (1 > 0 ? 42 : 3.14);
  double l3 = (null ?? 42);
  const double l4 = -42;
  final double l5 = 23;

  l1 = -42;
  l1 = null;
  l1 ??= 42;
  l1 ??= -42;

}

main() {
  double d1 = 42;
  double d2 = (1 > 0 ? 42 : 3.14);
  double d3 = (null ?? 42);
  const double d4 = -42;
  final double d5 = 23;

  d1 = -42;
  d1 = null;
  d1 ??= 42;
  d1 ??= -42;

  foo();
  C.staticMethod();
  new C().instanceMethod();

  void bar() {
    double b1 = 42;
    double b2 = (1 > 0 ? 42 : 3.14);
    double b3 = (null ?? 42);
    const double b4 = -42;
    final double b5 = 23;

    b1 = -42;
    b1 = null;
    b1 ??= 42;
    b1 ??= -42;
  }
  bar();
}

/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of a double valued integer literal is [double]
 * @description Checks that the static type of a double valued integer literal
 * is [double]. Test local variable assignment and hexadecimal literals
 * @author sgrekhov@unipro.ru
 */

class C {

  static void staticMethod() {
    double s1 = 0x42;
    double s2 = (1 > 0 ? 0x42 : 3.14);
    double s3 = (null ?? 0x42);
    const double s4 = -0x42;
    final double s5 = 0x23;

    s1 = -0x42;
    s1 = null;
    s1 ??= 0x42;
    s1 ??= -0x42;
  }

  void instanceMethod() {
    double m1 = 0x42;
    double m2 = (1 > 0 ? 0x42 : 3.14);
    double m3 = (null ?? 0x42);
    const double m4 = -0x42;
    final double m5 = 0x23;

    m1 = -0x42;
    m1 = null;
    m1 ??= 0x42;
    m1 ??= -0x42;
  }
}

void foo() {
  double l1 = 0x42;
  double l2 = (1 > 0 ? 0x42 : 3.14);
  double l3 = (null ?? 0x42);
  const double l4 = -0x42;
  final double l5 = 0x23;

  l1 = -0x42;
  l1 = null;
  l1 ??= 0x42;
  l1 ??= -0x42;

}

main() {
  double d1 = 0x42;
  double d2 = (1 > 0 ? 0x42 : 3.14);
  double d3 = (null ?? 0x42);
  const double d4 = -0x42;
  final double d5 = 0x23;

  d1 = -0x42;
  d1 = null;
  d1 ??= 0x42;
  d1 ??= -0x42;

  foo();
  C.staticMethod();
  new C().instanceMethod();

  void bar() {
    double b1 = 0x42;
    double b2 = (1 > 0 ? 0x42 : 3.14);
    double b3 = (null ?? 0x42);
    const double b4 = -0x42;
    final double b5 = 0x23;

    b1 = -0x42;
    b1 = null;
    b1 ??= 0x42;
    b1 ??= -0x42;
  }
  bar();
}

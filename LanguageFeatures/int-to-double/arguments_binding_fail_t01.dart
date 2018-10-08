/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of a double valued integer literal is [double]
 * @description Checks that the static type of a double valued integer literal
 * is [double]. Test arguments binding and generic routine
 * @author sgrekhov@unipro.ru
 */

class C<X extends num, Y extends double> {
  void methodX(X val) {}
  void methodY(Y val) {}

  test() {
    methodX(42);    //# 01: compile-time error
    methodX(0x42);  //# 02: compile-time error
    methodY(42);    //# 03: compile-time error
    methodY(0x42);  //# 04: compile-time error
  }
}

void foo<X extends num, Y extends double>() {
  bar1<X>(42);      //# 05: compile-time error
  bar1<X>(0x42);    //# 06: compile-time error
  bar1<Y>(42);      //# 07: compile-time error
  bar1<Y>(0x42);    //# 08: compile-time error

  bar2<X>(42);      //# 09: compile-time error
  bar2<X>(0x42);    //# 10: compile-time error
  bar2<Y>(42);      //# 11: compile-time error
  bar2<Y>(0x42);    //# 12: compile-time error
}

void bar1<X extends num>(X x) {}
void bar2<Y extends double>(Y y) {}


main() {
  C<double, double> c = C<double, double>();
  c.test();

  foo<double, double>();
}

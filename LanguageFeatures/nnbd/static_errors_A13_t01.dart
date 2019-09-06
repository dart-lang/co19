/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error to call a method, setter, or getter on a receiver
 * of static type Never (including via a null aware operator).
 *
 * @description Check that it is an error to call a method, setter, or getter on
 * a receiver of static type Never (including via a null aware operator).
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
class A {
  void set setter(int v) {}
  int operator[](int index) => 0;
}

void test(var x) {
  if (x is Never) {
    x.toString();         //# 01: compile-time error
    x.runtimeType;        //# 02: compile-time error
    x.setter = 42;        //# 03: compile-time error

    x?.toString();        //# 04: compile-time error
    x?.runtimeType;       //# 05: compile-time error
    x?.setter = 42;       //# 06: compile-time error

    x?..toString();       //# 07: compile-time error
    x?..runtimeType;      //# 08: compile-time error
    x?..setter = 42;      //# 09: compile-time error

    x?.[0];               //# 10: compile-time error
  }
}

main() {
  A? a = null;
  test(a);
}

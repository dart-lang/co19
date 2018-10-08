/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of a double valued integer literal is [double]
 * @description Checks that it is a compile error if integer but not a literal
 * is assigned to class member via this expression
 * @compile-error
 * @author sgrekhov@unipro.ru
 */
int foo() => 42;

class C {
  double m1;

  void set instanceSetter(double val) {
    m1 = val;
  }

  test() {
    this.m1 = foo();                  //# 01: compile-time error
    this?.m1 = foo();                 //# 02: compile-time error
    this.m1 ??= foo();                //# 03: compile-time error
    this?.m1 ??= foo();               //# 04: compile-time error

    this.instanceSetter = foo();      //# 05: compile-time error
    this?.instanceSetter = foo();     //# 06: compile-time error
  }
}

main() {
  C c = C();
  c.test();
}

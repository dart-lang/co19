/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of a double valued integer literal is [double]
 * @description Checks that it is a compile error if integer but not a literal
 * is assigned to a class member
 * @compile-error
 * @author sgrekhov@unipro.ru
 */
int foo() => 42;

class C {
  double m;
  static double s;

  void set instanceSetter(double val) {
    m = val;
  }

  static void set staticSetter(double val) {
    s = val;
  }
}

main() {
  C.s = foo();                  //# 01: compile-time error
  C?.s = foo();                 //# 02: compile-time error
  C.s ??= foo();                //# 03: compile-time error
  C?.s ??= foo();               //# 04: compile-time error
  C.staticSetter = foo();       //# 05: compile-time error
  C?.staticSetter = foo();      //# 06: compile-time error

  C c = null;
  c?.m1 = foo();                //# 07: compile-time error
  c?.instanceSetter = foo();    //# 08: compile-time error
  c = new C();
  c.m1 = foo();                 //# 09: compile-time error
  c.instanceSetter = foo();     //# 10: compile-time error
  c?.m1 = foo();                //# 11: compile-time error
  c?.instanceSetter = foo();    //# 12: compile-time error
  c.m1 ??= foo();               //# 13: compile-time error
  c?.m1 ??= foo();              //# 14: compile-time error
}

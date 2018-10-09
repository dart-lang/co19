/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Mixin application semantics is mostly unchanged, except that it's
 * a compile-time error to apply a mixin to a class that doesn't implement all
 * the 'on' type requirements of the mixin declaration, or apply a mixin
 * containing super-invocations to a class that doesn't have a concrete
 * implementation of the super-invoked members compatible with the
 * super-constraint interface.
 *
 * @description Checks that it is a compile error to apply a mixin to a class
 * that doesn't implement all the 'on' type requirements of the mixin
 * declaration.
 * @compile-error
 * @author ngl@unipro.ru
 * @author sgrekhov@unipro.ru
 */

abstract class I {
  int get i;
}
abstract class J {
  int get j;
}

abstract class B {
  int get b;
}
abstract class C {
  int get c;
}

mixin M on B, C implements I, J {
  int get m;
}

//  int get i;   not implemented
class A {           //# 01: compile-time error
  int get j => 2;   //# 01: compile-time error
  int get b => 3;   //# 01: compile-time error
  int get c => 4;   //# 01: compile-time error
}                   //# 01: compile-time error

//  int get j;   not implemented
class A {           //# 02: compile-time error
  int get i => 1;   //# 02: compile-time error
  int get b => 3;   //# 02: compile-time error
  int get c => 4;   //# 02: compile-time error
}                   //# 02: compile-time error

//  int get b;   not implemented
class A {           //# 03: compile-time error
  int get i => 1;   //# 03: compile-time error
  int get j => 2;   //# 03: compile-time error
  int get c => 4;   //# 03: compile-time error
}                   //# 03: compile-time error

//  int get c;   not implemented
class A {           //# 04: compile-time error
  int get i => 1;   //# 04: compile-time error
  int get j => 2;   //# 04: compile-time error
  int get b => 3;   //# 04: compile-time error
}                   //# 04: compile-time error

class MA extends A with M {
}

main() {
  new MA();
}

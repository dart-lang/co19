/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The mixin introduced by a mixin declaration contains all the
 * non-static members declared by the mixin, just as the mixin derived from a
 * class declaration currently does.
 *
 * @description Checks that a mixin declaration contains all the non-static
 * members declared by the mixin, just as the mixin derived from a class
 * declaration currently does. It is a compile error if any of mixin member is
 * not implemented in mixin application.
 * @compile-error
 * @author ngl@unipro.ru
 *

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
class MA1 with M { //# 01: compile-time error
  int get j => 2;
  int get b => 3;
  int get c => 4;
  int get m => 5;
}

//  int get j;   not implemented
class MA2 with M { //# 02: compile-time error
  int get i => 1;
  int get b => 3;
  int get c => 4;
  int get m => 5;
}

//  int get b;   not implemented
class MA3 with M { //# 03: compile-time error
  int get i => 1;
  int get j => 2;
  int get c => 4;
  int get m => 5;
}

//  int get c;   not implemented
class MA4 with M { //# 04: compile-time error
  int get i => 1;
  int get j => 2;
  int get b => 3;
  int get m => 5;
}

//  int get m;   not implemented
class MA5 with M { //# 05: compile-time error
  int get i => 1;
  int get j => 2;
  int get b => 3;
  int get c => 4;
}

main() {
}
*/

class A {
  String get g => "g";
}

class C {
  noSuchMethod(Invocation i) {
    print("C.noSuchMethod ivocked");

  }
}

mixin M on A {
  test() {
    super.g;
  }

  noSuchMethod(Invocation i) {
    print("M.noSuchMethod ivocked");
  }
}

class MA extends C with M {
}

main() {
  print(new MA().g);
  print(new MA().test());
}
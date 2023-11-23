// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The mixin introduced by a mixin declaration contains all the
/// non-static members declared by the mixin, just as the mixin derived from a
/// class declaration currently does.
///
/// @description Checks that a mixin declaration doesn't contain the static
/// members declared by the mixin
/// @author ngl@unipro.ru
/// @author sgrekhov@unipro.ru


class I {
  static int i1 = 1;
}

abstract class J {
  static int j1 = 2;
}

class A {
  static int b1 = 3;
}

abstract class B {
  static int b1 = 3;
}

class C implements A, B {
  static int c1 = 4;
}

mixin M on A, B implements I, J {
  static int m1 = 5;
}

class MA extends C with M {
  test() {
    i1 == 1;
//  ^^
// [analyzer] COMPILE_TIME_ERROR.UNDEFINED_IDENTIFIER
// [cfe] The getter 'i1' isn't defined for the class 'MA'.
    j1 == 2;
//  ^^
// [analyzer] COMPILE_TIME_ERROR.UNDEFINED_IDENTIFIER
// [cfe] The getter 'j1' isn't defined for the class 'MA'.
    b1 == 3;
//  ^^
// [analyzer] COMPILE_TIME_ERROR.UNDEFINED_IDENTIFIER
// [cfe] The getter 'b1' isn't defined for the class 'MA'.
    c1 == 4;
//  ^^
// [analyzer] COMPILE_TIME_ERROR.UNQUALIFIED_REFERENCE_TO_NON_LOCAL_STATIC_MEMBER
// [cfe] The getter 'c1' isn't defined for the class 'MA'.
    m1 == 5;
//  ^^
// [analyzer] COMPILE_TIME_ERROR.UNQUALIFIED_REFERENCE_TO_NON_LOCAL_STATIC_MEMBER
// [cfe] The getter 'm1' isn't defined for the class 'MA'.
  }
}

main() {
  MA ma = new MA();
  MA.i1 == 1;
//   ^^
// [analyzer] COMPILE_TIME_ERROR.UNDEFINED_GETTER
// [cfe] Member not found: 'i1'.
  MA.j1 == 2;
//   ^^
// [analyzer] COMPILE_TIME_ERROR.UNDEFINED_GETTER
// [cfe] Member not found: 'j1'.
  MA.b1 == 3;
//   ^^
// [analyzer] COMPILE_TIME_ERROR.UNDEFINED_GETTER
// [cfe] Member not found: 'b1'.
  MA.c1 == 4;
//   ^^
// [analyzer] COMPILE_TIME_ERROR.UNDEFINED_GETTER
// [cfe] Member not found: 'c1'.
  MA.m1 == 5;
//   ^^
// [analyzer] COMPILE_TIME_ERROR.UNDEFINED_GETTER
// [cfe] Member not found: 'm1'.

  ma.test();
}

// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion But in a non-pattern assignment, `_` is treated as a normal
/// identifier. If it resolves to something assignable (which now must mean a
/// member or top-level declaration), the assignment is valid.
///
/// @description Checks that a non-pattern assignment to `_` is valid when `_`
/// resolves to an assignable member or top-level variable. Test that it is a
/// compile-time error if type of is not assignable to type of variable `_`.
/// @author sgrekhov22@gmail.com
/// @issue 64205

import 'dart:async';

int _ = 0;

class A {
  int _ = 0;
}

class C extends A {
  int _ = 0;

  void test(String s, double d) {
    _ = s;
//      ^
// [analyzer] unspecified
// [cfe] unspecified
    _ = d;
//      ^
// [analyzer] unspecified
// [cfe] unspecified
    _ = null;
//      ^^^^
// [analyzer] unspecified
// [cfe] unspecified
    this._ = s;
//           ^
// [analyzer] unspecified
// [cfe] unspecified
    super._ = s;
//            ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

class D {
  Object _ = Object();

  void test(FutureOr<Object?> v) {
    _ = v;
//      ^
// [analyzer] unspecified
// [cfe] unspecified
    this._ = v;
//           ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

class S {
  static int _ = 0;

  static void test(String s) {
    _ = s;
//      ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

class Setter {
  set _(int v) {}

  void test(String s) {
    _ = s;
//      ^
// [analyzer] unspecified
// [cfe] unspecified
    this._ = s;
//           ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

void testTopLevel(String s, double d) {
  _ = s;
//    ^
// [analyzer] unspecified
// [cfe] unspecified
  _ = d;
//    ^
// [analyzer] unspecified
// [cfe] unspecified
  _ = null;
//    ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void testCascade(String s, FutureOr<Object?> v) {
  C().._ = s;
//         ^
// [analyzer] unspecified
// [cfe] unspecified
  D().._ = v;
//         ^
// [analyzer] unspecified
// [cfe] unspecified
}

void testNullAware(C? c, D? d, String s, FutureOr<Object?> v) {
  c?._ = s;
//       ^
// [analyzer] unspecified
// [cfe] unspecified
  d?._ = v;
//       ^
// [analyzer] unspecified
// [cfe] unspecified
}

void testFutureOr(FutureOr<Object?> v) {
  // Valid: `FutureOr<Object?>` is assignable to `Object?`.
  Object? _ = v;

  Object _ = v;
//           ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(D);
  print(Setter);
  print(testTopLevel);
  print(testCascade);
  print(testCascade);
  print(testNullAware);
  print(testFutureOr);
}

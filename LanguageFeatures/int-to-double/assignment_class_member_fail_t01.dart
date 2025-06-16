// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The static type of a double valued integer literal is [double]
/// @description Checks that it is a compile error if integer but not a literal
/// is assigned to a class member
/// @author sgrekhov@unipro.ru

int foo() => 42;

class C {
  double m = 0;
  static double s = 0;

  void set instanceSetter(double val) {
    m = val;
  }

  static void set staticSetter(double val) {
    s = val;
  }
}

main() {
  C.s = foo();
//      ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  C?.s = foo();
//       ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  C.s ??= foo();
//        ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  C?.s ??= foo();
//         ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  C.staticSetter = foo();
//                 ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  C?.staticSetter = foo();
//                  ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  C? c = null;
  c?.m1 = foo();
//   ^^
// [analyzer] unspecified
// [cfe] unspecified
  c?.instanceSetter = foo();
//                    ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  c = new C();
  c.m1 = foo();
//  ^^
// [analyzer] unspecified
// [cfe] unspecified
  c.instanceSetter = foo();
//                   ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  c?.m1 = foo();
//   ^^
// [analyzer] unspecified
// [cfe] unspecified
  c?.instanceSetter = foo();
//                    ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  c.m1 ??= foo();
//  ^^
// [analyzer] unspecified
// [cfe] unspecified
  c?.m1 ??= foo();
//   ^^
// [analyzer] unspecified
// [cfe] unspecified
}

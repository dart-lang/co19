// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if the modifier covariant occurs in
/// the declaration of a formal parameter of a function which is not an instance
/// method, an instance setter, or an operator
///
/// @description Checks that various correct declarations with only required
/// formal parameters do not cause any errors.
/// @author sgrekhov22@gmail.com

void f1(covariant int i) {}
//      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

void f2([covariant int i = 0]) {}
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

void f3({covariant int i = 0}) {}
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

void f4({required covariant int i}) {}
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

void set s1(covariant int i) {}
//          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class C {
  static void f1(covariant int i) {}
//               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  static void f2([covariant int i = 0]) {}
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  static void f3({covariant int i = 0}) {}
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  static void f4({required covariant int i}) {}
//                         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  static void set s1(covariant int i) {}
//                   ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

}

main() {
  void g1(covariant int i) {}
//        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void g2([covariant int i = 0]) {}
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void g3({covariant int i = 0}) {}
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void g4({required covariant int i}) {}
//                  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var h1 = (covariant int i) {};
//          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var h2 = ([covariant int i = 0]) {};
//           ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var h3 = ({covariant int i = 0}) {};
//           ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var h4 = ({required covariant int i}) {};
//                    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  print(f1);
  print(f2);
  print(f3);
  print(f4);
  print(g1);
  print(g2);
  print(g3);
  print(g4);
  print(h1);
  print(h2);
  print(h3);
  print(h4);
  print(C);
}

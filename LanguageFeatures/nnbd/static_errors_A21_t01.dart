// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is an error for a variable to be declared as late in any of the
/// following positions: in a formal parameter list of any kind; in a catch
/// clause; in the variable binding section of a c-style for loop, a for in loop,
/// an await for loop, or a for element in a collection literal.
///
/// @description Check that it is an error for a formal parameter to be declared
/// late.
/// @author sgrekhov@unipro.ru

class C {
  C(late int x) {}
//  ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  C(int x, [late String y]) {}
//^
// [analyzer] unspecified
// [cfe] unspecified

  C(int x, {late String y}) {}
//^
// [analyzer] unspecified
// [cfe] unspecified

  static void s1(late int x) {}
//               ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  static void s2(int x, [late String y]) {}
//                       ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  static void s3(int x, {late String y}) {}
//                       ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void m1(late int x) {}
//        ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void m2(int x, [late String y]) {}
//                ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void m3(int x, {late String y}) {}
//                ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void set(late int x) {}
//         ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  C operator +(late C other) => other;
//             ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void f1(late int x) {}
//      ^^^^
// [analyzer] unspecified
// [cfe] unspecified

void f2(int x, [late String y]) {}
//              ^^^^
// [analyzer] unspecified
// [cfe] unspecified

void f3(int x, {late String y}) {}
//              ^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
}

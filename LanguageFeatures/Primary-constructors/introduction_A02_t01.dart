// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Optional parameters can be declared as usual in a primary
/// constructor, with default values that must be constant as usual.
///
/// @description Check that it is a compile-time error to specify a default
/// value of an optional parameter of a primary constructor which is not a
/// constant.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

int nonConstant = 0;

class C1([var int v = nonConstant]);
//                    ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class C2([final int v = nonConstant]);
//                      ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class C3([int v = nonConstant]);
//                ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class C4({var int v = nonConstant});
//                      ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class C5({final int v = nonConstant});
//                      ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class C6({int v = nonConstant});
//                ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

enum E1([final int v = nonConstant]) {
//                     ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  e0;
}

enum E2([int v = nonConstant]) {
//               ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  e0;
}

enum E3({final int v = nonConstant}) {
//                     ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  e0;
}

enum E4({int v = nonConstant}) {
//               ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  e0;
}

main() {
  print(C1);
  print(C2);
  print(C3);
  print(C4);
  print(C5);
  print(C6);
  print(E1);
  print(E2);
  print(E3);
}

// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Other declarations: top-level variables, top-level function
/// names, type names, member names, etc. are unchanged. They can be named `_`
/// as they are today.
///
/// @description Checks that it is a compile-time error to declare more than one
/// member named `_`. Test a static variable vs other extension members conflict
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=wildcard-variables

class A {}

extension EA1 on A {
  static int _ = 1;
  static int _ = 1;
//           ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension E2 on A {
  static int _ = 1;
  static int _() => 2;
//           ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension E3 on A {
  static int _ = 1;
  static int get _ => 3;
//               ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension E4 on A {
  static int _ = 1;
  static void set _(int v) {}
//                ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension E5 on A {
  static int _ = 1;
//           ^
// [analyzer] unspecified
  int _() => 5;
//    ^
// [cfe] unspecified
}

extension E6 on A {
  static int _ = 1;
//           ^
// [analyzer] unspecified
  int get _ => 7;
//        ^
// [cfe] unspecified
}

extension E7 on A {
  static int _ = 1;
//           ^
// [analyzer] unspecified
// [cfe] unspecified
  void set _(int v) {}
//         ^
// [cfe] unspecified
}

main() {
  print(A);
}

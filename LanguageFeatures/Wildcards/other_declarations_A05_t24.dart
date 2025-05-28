// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Other declarations: top-level variables, top-level function
/// names, type names, member names, etc. are unchanged. They can be named `_`
/// as they are today.
///
/// @description Checks that it is a compile-time error to declare more than one
/// member named `_`. Test a static method vs other enum members conflict.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=wildcard-variables

mixin class ContainsWildcardMethod {
  int _() => 0;
}

mixin class ContainsWildcardGetter {
  int get _ => 0;
}

mixin class ContainsWildcardSetter {
  void set _(int v) {}
}

enum E1 {
  e0;
  static int _() => 1;
  static int _ = 1;
//           ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E2 {
  e0;
  static int _() => 1;
  static int _() => 2;
//           ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E3 {
  e0;
  static int _() => 1;
  static int get _ => 3;
//               ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E4 {
  e0;
  static int _() => 1;
  static void set _(int v) {}
//                ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E5 {
  e0;
  static int _() => 1;
//           ^
// [analyzer] unspecified
  final int _ = 5;
//          ^
// [cfe] unspecified
}

enum E6 {
  e0;
  static int _() => 1;
//           ^
// [analyzer] unspecified
  int _() => 6;
//    ^
// [cfe] unspecified
}

enum E6With with ContainsWildcardMethod {
  e0;
  static int _() => 1;
//           ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E7 {
  e0;
  static int _() => 1;
//           ^
// [analyzer] unspecified
  int get _ => 7;
//        ^
// [cfe] unspecified
}

enum E7With with ContainsWildcardGetter {
  e0;
  static int _() => 1;
//           ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E8 {
  e0;
  static int _() => 1;
//           ^
// [analyzer] unspecified
  void set _(int v) {}
//         ^
// [cfe] unspecified
}

enum E8With with ContainsWildcardSetter {
  e0;
  static int _() => 1;
//           ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(E1);
  print(E2);
  print(E3);
  print(E4);
  print(E5);
  print(E6);
  print(E6With);
  print(E7);
  print(E7With);
  print(E8);
  print(E8With);
}

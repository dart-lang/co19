// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Other declarations: top-level variables, top-level function
/// names, type names, member names, etc. are unchanged. They can be named `_`
/// as they are today.
///
/// @description Checks that it is a compile-time error to declare more than one
/// member named `_`. Test a static getter vs other mixin members conflict.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=wildcard-variables

class ContainsWildcardVariable {
  int _ = 0;
}

class ContainsWildcardMethod {
  int _() => 0;
}

class ContainsWildcardGetter {
  int get _ => 0;
}

class ContainsWildcardSetter {
  void set _(int v) {}
}

mixin M1 {
  static int get _ => 1;
  static int _ = 1;
//           ^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M2 {
  static int get _ => 1;
  static int _() => 2;
//           ^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M3 {
  static int get _ => 1;
  static int get _ => 3;
//               ^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M4 {
  static int get _ => 1;
  static void set _(int v) {} // Ok
}

mixin M5 {
  static int get _ => 1;
//               ^
// [analyzer] unspecified
  int _ = 5;
//    ^
// [cfe] unspecified
}

mixin M5On on ContainsWildcardVariable {
  static int get _ => 1;
//               ^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M5Implements implements ContainsWildcardVariable {
  static int get _ => 1;
//               ^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M6 {
  static int get _ => 1;
//               ^
// [analyzer] unspecified
  int _() => 6;
//    ^
// [cfe] unspecified
}

mixin M6On on ContainsWildcardMethod {
  static int get _ => 1;
//               ^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M6Implements implements ContainsWildcardMethod {
  static int get _ => 1;
//               ^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M7 {
  static int get _ => 1;
//               ^
// [analyzer] unspecified
  int get _ => 7;
//        ^
// [cfe] unspecified
}

mixin M7On on ContainsWildcardGetter {
  static int get _ => 1;
//               ^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M7Implements implements ContainsWildcardGetter {
  static int get _ => 1;
//               ^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M8 {
  static int get _ => 1;
//               ^
// [analyzer] unspecified
// [cfe] unspecified
  void set _(int v) {}
//         ^
// [cfe] unspecified
}

mixin M8On on ContainsWildcardSetter {
  static int get _ => 1;
//               ^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M8Implements implements ContainsWildcardSetter {
  static int get _ => 1;
//               ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(M1);
  print(M2);
  print(M3);
  print(M4);
  print(M5);
  print(M5On);
  print(M5Implements);
  print(M6);
  print(M6On);
  print(M6Implements);
  print(M7);
  print(M7On);
  print(M7Implements);
  print(M8);
  print(M8On);
  print(M8Implements);
}

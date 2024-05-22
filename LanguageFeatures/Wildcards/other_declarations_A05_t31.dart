// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Other declarations: top-level variables, top-level function
/// names, type names, member names, etc. are unchanged. They can be named `_`
/// as they are today.
///
/// @description Checks that it is a compile-time error to declare more than one
/// member named `_`. Test a static getter vs other extension type members
/// conflict.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=wildcard-variables

class ContainsWildcardMethod {
  int _() => 0;
}

class ContainsWildcardGetter {
  int get _ => 0;
}

class ContainsWildcardSetter {
  void set _(int v) {}
}

extension type ET1(int id) {
  static int get _ => 1;
  static int _ = 1;
//           ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET2(int id) {
  static int get _ => 1;
  static int _() => 2;
//           ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET3(int id) {
  static int get _ => 1;
  static int get _ => 3;
//               ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET4(int id) {
  static int get _ => 1;
  static void set _(int v) {} // Ok
}

extension type ET5(int _) {
  static int get _ => 1;
//           ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET6(int id) {
  static int get _ => 1;
//               ^
// [analyzer] unspecified
  int _() => 6;
//    ^
// [cfe] unspecified
}

extension type ET6Implements(ContainsWildcardMethod id)
      implements ContainsWildcardMethod {
  static int get _ => 0;
//               ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET7(int id) {
  static int get _ => 1;
//               ^
// [analyzer] unspecified
  int get _ => 7;
//        ^
// [cfe] unspecified
}

extension type ET7Implements(ContainsWildcardGetter id)
      implements ContainsWildcardGetter {
  static int get _ => 1;
//               ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET8(int id) {
  static int get _ => 1;
//               ^
// [analyzer] unspecified
// [cfe] unspecified
  void set _(int v) {}
//         ^
// [cfe] unspecified
}

extension type ET8Implements(ContainsWildcardSetter id)
      implements ContainsWildcardSetter {
  static int get _ => 1;
//               ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(ET1);
  print(ET2);
  print(ET3);
  print(ET4);
  print(ET5);
  print(ET6);
  print(ET6Implements);
  print(ET7);
  print(ET7Implements);
  print(ET8);
  print(ET8Implements);
}

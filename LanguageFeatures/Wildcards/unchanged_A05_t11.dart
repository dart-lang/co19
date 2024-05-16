// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Other declarations: top-level variables, top-level function
/// names, type names, member names, etc. are unchanged. They can be named `_`
/// as they are today.
///
/// @description Checks that it is a compile-time error to declare more than one
/// member named `_`. Test an instance getter vs other class members conflict.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=wildcard-variables

class C1 {
  int get _ => 1;
  static int _ = 1;
//           ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2 {
  int get _ => 1;
  static int _() => 2;
//           ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C3 {
  int get _ => 1;
  static int get _ => 3;
//               ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C4 {
  int get _ => 1;
  static void set _(int v) {}
//                ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C5 {
  int get _ => 1;
  int _ = 5;
//    ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C6 {
  int get _ => 1;
  int _() => 6;
//    ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C7 {
  int get _ => 1;
  int get _ => 7;
//        ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C8 {
  int get _ => 1;
  void set _(int v) {} // Ok
}

main() {
  print(C1);
  print(C2);
  print(C3);
  print(C4);
  print(C5);
  print(C6);
  print(C7);
  print(C8);
}

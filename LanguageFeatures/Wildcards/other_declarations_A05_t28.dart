// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Other declarations: top-level variables, top-level function
/// names, type names, member names, etc. are unchanged. They can be named `_`
/// as they are today.
///
/// @description Checks that it is a compile-time error to declare more than one
/// member named `_`. Test an instance method vs other enum members conflict.
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
  int _() => 1;
  final int _ = 5;
//          ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E2 {
  e0;
  int _() => 1;
  int _() => 6;
//    ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E2With with ContainsWildcardMethod {
  e0;
  int _() => 1; // Ok
}

enum E3 {
  e0;
  int _() => 1;
  int get _ => 7;
//        ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E3With with ContainsWildcardGetter {
  e0;
  int _() => 1;
//    ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E4 {
  e0;
  int _() => 1;
  void set _(int v) {}
//         ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E4With with ContainsWildcardSetter {
  e0;
  int _() => 1;
//    ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(E1);
  print(E2);
  print(E2With);
  print(E3);
  print(E3With);
  print(E4);
  print(E4With);
}

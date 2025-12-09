// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The following errors apply to formal parameters of a primary
/// constructor. Let `p` be a formal parameter of a primary constructor in a
/// class, mixin class, enum, or extension type declaration `D` named `C`:
/// ...
/// A compile-time error occurs if `p` has the modifier covariant, but not `var`.
///
/// @description Check that it is a compile-time error if a formal parameters of
/// a primary constructor has both of the modifiers `covariant` and `final`.
/// Test enums.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

enum E1(covariant final String x) {
//                ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  e0("");
}

enum E2([covariant final String x = ""]) {
//                 ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  e0();
}

enum E3({covariant final String x = ""}) {
//                 ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  e0();
}

enum E4({required covariant final String x}) {
//                          ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  e0(x: "");
}

main() {
  print(E1);
  print(E2);
  print(E3);
  print(E4);
}

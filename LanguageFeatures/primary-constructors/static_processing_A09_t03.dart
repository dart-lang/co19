// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The following errors apply to formal parameters of a declaring
/// constructor, be it in the header or in the body. Let `p` be a formal
/// parameter of a declaring constructor in a class, enum, or extension type
/// declaration `D` named `C`:
/// ...
/// A compile-time error occurs if `p` has the modifier `covariant`, but neither
/// `var` nor `final`.
///
/// @description Check that it is a compile-time error if a formal parameters of
/// a declaring constructor has the modifier `covariant`, but neither `var` nor
/// `final`. Test enums.
/// @author sgrekhov22@gmail.com

// TODO (sgrekhov) Add `declaring-constructors` experimental flag

enum E1(covariant String x) {
//      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  e0("");
}

enum E2([covariant String x = ""]) {
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  e0();
}

enum E3({covariant String x = ""}) {
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  e0();
}

enum E4({required covariant String x}) {
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  e0(x: "");
}

enum E5 {
  this(covariant String x);
//     ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  e0("");
}

enum E6 {
  this([covariant String x = ""]);
//      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  e0();
}

enum E7 {
  this({covariant String x = ""});
//      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  e0();
}

enum E8 {
  this({required covariant String x});
//               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  e0(x: "");
}

main() {
  print(E1);
  print(E2);
  print(E3);
  print(E4);
  print(E5);
  print(E6);
  print(E7);
  print(E8);
}

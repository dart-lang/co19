// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The following errors apply to formal parameters of a declaring
/// constructor, be it in the header or in the body. Let `p` be a formal
/// parameter of a declaring constructor in a class, enum, or extension type
/// declaration `D` named `C`:
///
/// A compile-time error occurs if `p` contains a term of the form
/// `this.v`, or `super.v` where `v` is an identifier, and `p` has the modifier
/// `covariant`.
///
/// @description Check that it is a compile-time error if a formal parameter of
/// a declaring constructor contains a term of the form `this.v` and has the
/// modifier `covariant`. Test enums.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

enum E1(covariant String this.x) {
//   ^^
// [analyzer] unspecified
// [cfe] unspecified
  e0("");
  final String x;
}

enum E2([covariant this.x = ""]) {
//    ^^
// [analyzer] unspecified
// [cfe] unspecified
  e0("");
  final String x;
}

enum E3({covariant String this.x = ""}) {
//    ^^
// [analyzer] unspecified
// [cfe] unspecified
  e0("");
  final String x;
}

enum E4({required covariant String this.x}) {
//    ^^
// [analyzer] unspecified
// [cfe] unspecified
  e0("");
  final String x;
}

enum E5 {
  e0("");
  final String x;
  this(covariant String this.x);
//^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E6 {
  e0("");
  final String x;
  this([covariant this.x = ""]);
//^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E7 {
  e0("");
  final String x;
  this({covariant String this.x = ""});
//^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E8 {
  e0("");
  final String x;
  this({required covariant String this.x});
//^^^^
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
  print(E7);
  print(E8);
}

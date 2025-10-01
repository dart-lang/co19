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
/// `final`. Test extension types.
/// @author sgrekhov22@gmail.com

// TODO (sgrekhov) Add `declaring-constructors` experimental flag

extension type ET1(covariant String x) {}
//                 ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

extension type ET2([covariant String x = ""]) {}
//                  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

extension type ET3({covariant String x = ""}) {}
//                  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

extension type ET4({required covariant String x}) {}
//                           ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

extension type ET5 {
  this(covariant String x);
//     ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET6 {
  this([covariant String x = ""]);
//      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET7 {
  this({covariant String x = ""});
//      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET8 {
  this({required covariant String x});
//               ^^^^^^^^^
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
  print(ET7);
  print(ET8);
}

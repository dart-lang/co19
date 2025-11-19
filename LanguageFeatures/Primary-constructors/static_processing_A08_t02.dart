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
/// Test extension types.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

extension type ET1(covariant final String x) {}
//                           ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

// Representation variable is always final even without `final` keyword
extension type ET2([covariant String x = ""]) {}
//                  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

extension type ET3({covariant final String x = ""}) {}
//                            ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

extension type ET4({required covariant String x}) {}
//                           ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(ET1);
  print(ET2);
  print(ET3);
  print(ET4);
}

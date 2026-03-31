// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error also occurs if the body of `D` contains a
/// body part for the primary constructor, and it has an initializer list, and
/// the initializer list contains an expression which is not potentially
/// constant.
///
/// @description Check that it is a compile-time error if a declaration with a
/// constant primary constructor contains a body part for the primary
/// constructor with the initializer list, and it contains an expression which
/// is not potentially constant.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

final int nonConstant = 0;

class const C(final int x) {
  final int v;
  this : v = nonConstant;
//           ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin class const M(final int x) {
  final int v;
  this : v = nonConstant;
//           ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E(final int x) {
  e0(0);
  final int v;
  this : v = nonConstant;
//           ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(M);
  print(E);
}

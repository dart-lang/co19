// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if a class, mixin class, enum, or
/// extension type declaration `D` has a constant generative constructor, and a
/// non-late instance variable declaration in the body of `D` has an
/// initializing expression which is not potentially constant.
///
/// @description Check that it is a compile-time error if a declaration with a
/// constant primary constructor has a non-late instance variable declaration
/// with an initializing expression which is not potentially constant.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

final int nonConstant = 0;

class const C(final int x) {
  final int v = nonConstant;
//              ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin class const M(final int x) {
  final int v = nonConstant;
//              ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E(final int x) {
  e0(0);
  final int v = nonConstant;
//              ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(M);
  print(E);
}

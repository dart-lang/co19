// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Moreover, for every constant expression which is an instance
/// creation that invokes a constructor of `D`, a compile-time error occurs if
/// the result of substituting actual arguments of the constructor invocation
/// into one of the above mentioned initializing expressions or initializer list
/// elements yields an expression which is not constant.
///
/// @description Check that it is a compile-time error if a constant primary
/// constructor is invoked in a constant expression with a non-constant
/// arguments.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

final int nonConstant = 0;

class const C(final int x, int y) {
  final int v;
  this : v = y;
}

enum E(final int x, int y) {
  e0(nonConstant, 1),
//   ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  e1(0, nonConstant);
//      ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  final int v;
  this : v = y;
}

extension type const ET(int v) {}

main() {
  const C(nonConstant, 1);
//        ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const C(1, nonConstant);
//           ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const ET(nonConstant);
//         ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

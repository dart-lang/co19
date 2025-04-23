// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A potentially constant expression is an expression that will
/// generally yield a constant value when the values of certain parameters are
/// given. The constant expressions is a subset of the potentially constant
/// expressions that can be evaluated at compile time.
/// ...
/// The potentially constant expressions and constant expressions are the
/// following:
/// ...
/// - A constant list literal is a potentially constant and constant expression.
///
/// @description Checks that a non-constant variable cannot be used in a
/// constant list literal.
/// @author sgrekhov22@gmail.com
/// @issue 53927

final nonconstant1 = 1;

const a = [nonconstant1];
//         ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

List<int> get test => const [nonconstant1];
//                           ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class C {
  final int nonconstant2 = 1;

  const C();

  List<int> get test1 => const [nonconstant2];
//                              ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  List<int> test2() => const [nonconstant2];
//                            ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(a);
  print(C);
}

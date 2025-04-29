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
/// - A constant map literal is a potentially constant and constant expression.
///
/// @description Checks that a non-constant map literal cannot be assigned to
/// a constant variable.
/// @author sgrekhov22@gmail.com
/// @issue 53927

final nonconstant1 = 1;

const a1 = {1: nonconstant1};
//             ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

var a2 = const {nonconstant1: 2};
//              ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

Map<int, int> get test1 => const {1: nonconstant1};
//                                   ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

Map<int, int> test2() => const {nonconstant1: 2};
//                              ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class C {
  final int nonconstant2 = 1;

  const C();

  Map<int, int> get test1 => const {1: nonconstant2};
//                                     ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  Map<int, int> test2() => const {nonconstant2: 2};
//                                ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(a1);
  print(a2);
  print(C);
}

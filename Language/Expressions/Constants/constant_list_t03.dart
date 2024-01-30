// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A constant expression is an expression whose value can never
/// change, and that can be evaluated entirely at compile time.
/// A constant expression is one of the following:
/// . . .
/// • A constant list literal, const <T>[e1, ..., en], or <T>[e1,..., en] that
///   occurs in a constant context, is a potentially constant expression if T is
///   a constant type expression, and e1, . . . , en are constant expressions.
///   It is further a constant expression if the list literal evaluates to an
///   object.
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

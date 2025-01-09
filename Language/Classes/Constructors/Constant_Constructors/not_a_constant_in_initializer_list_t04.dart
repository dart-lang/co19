// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Any expression that appears within the initializer list of a
/// constant constructor must be a potentially constant expression, or a
/// compile-time error occurs.
///
/// A potentially constant expression is an expression E that would be a valid
/// constant expression if all formal parameters of E's immediately enclosing
/// constant constructor were treated as compile-time constants that were
/// guaranteed to evaluate to an integer, boolean or string value as required
/// by their immediately enclosing superexpression.
///
/// @description Checks that it is a compile-time error when a constant
/// constructor's initializer list contains a use of a non-constant.
/// @author sgrekhov22@gmail.com
/// @issue 59804

class A {
  final int id;
  const A(this.id);
  static A answer = const A(42);
}

final A zero = const A(0);

class C {
  final A a;
  const C(this.a);
  const C.fromAnswer() : a = A.answer;
//                           ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const C.fromGlobal() : a = zero;
//                           ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
}

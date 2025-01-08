// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Given an expression that is a prefix of
/// `<staticMemberShorthandHead> <selector>*`, whose assigned shorthand context
/// denotes a declaration D, and where the identifier or `new` of the
/// `<staticMemberShorthandHead>` denotes a static declaration or constructor
/// declaration S when looked up on D.
/// ...
/// - An expression of `.id(arguments)` or `.id<typeArguments>(arguments)` where
///   S declares a getter or static function is never a constant expression.
///   There are no static functions whose invocation is constant, the only
///   non-instance function which can be invoked as a constant expression is
///   identical, which is not inside a static namespace.
///
/// @description Checks that an expression of the form `'.' id(arguments)` is
/// not a constant expression if `id` is a getter or static function declaration
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enum-shorthands

class C {
  const C();
  static C get id1 => const C();
  static C id2() => const C();

  C call() => const C();
}

extension type const ET(int _) {
  static ET get id1 => const ET(0);
  static ET id2() => const ET(0);
}

main() {
  C nc1 = .id1; // Ok
  const C c1 = .id1;
//             ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  C nc2 = .id1();
  const C c2 = .id1();
//             ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  C nc3 = .id2();
  const C c3 = .id2();
//             ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ET net1 = .id1;
  const ET et1 = .id1;
//               ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ET net2 = .id1();
  const ET et2 = .id1();
//               ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ET net3 = .id2();
  const ET et3 = .id2();
//               ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

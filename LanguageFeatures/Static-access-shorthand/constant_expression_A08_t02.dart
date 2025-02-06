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
/// @description Checks that an expression of the form
/// `'.' id<typeArguments>(arguments)` is not a constant expression if `id` is a
/// static function declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=dot-shorthands

class C {
  const C();
  static C id<T>() => const C();
}

extension type const ET(int _) {
  static ET id<T>() => const ET(0);
}

main() {
  C nc = .id<int>(); // Ok
  const C c = .id<int>();
//            ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ET net = .id<int>();
  const ET et = .id<int>();
//              ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

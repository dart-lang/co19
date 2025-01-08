// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Given an expression that is a prefix of
/// `<staticMemberShorthandHead> <selector>*`, whose assigned shorthand context
/// denotes a declaration D, and where the identifier or `new` of the
/// `<staticMemberShorthandHead>` denotes a static declaration or constructor
/// declaration S when looked up on D.
/// ...
/// - An expression of the form `.<identifier>` is a constant expression if S
///   declares a constant getter.
///
/// @description Checks that it is a compile-time error to use an expressions of
/// the form `'.' <identifier>` in a constant context if `<identifier>` is an
/// explicit getter declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enum-shorthands

class C {
  final String value;
  static C get instance => const C("C instance");

  const C(this.value);
}

extension type const ET(String value) {
  static ET get instance => const ET("ET instance");
}

main() {
  const C c = .instance;
//            ^
// [analyzer] unspecified
// [cfe] unspecified

  const ET et = .instance;
//              ^
// [analyzer] unspecified
// [cfe] unspecified
}

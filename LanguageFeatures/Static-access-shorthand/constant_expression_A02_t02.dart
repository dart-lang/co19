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
///   declares a corresponding static constant getter.
///
/// @description Checks that it is a compile-time error to use an expression of
/// the form `'.' <identifier>` in a constant context if `<identifier>` is an
/// explicit or implicit non-constant getter declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=dot-shorthands

class C {
  final String value;
  static C get instance1 => const C("C instance1");
  static final C instance2 = const C("C instance2");

  const C(this.value);
}

extension type const ET(String value) {
  static ET get instance1 => const ET("ET instance1");
  static final ET instance2 = const ET("ET instance2");
}

main() {
  C nc1 = .instance1; // Ok
  const C c1 = .instance1;
//             ^
// [analyzer] unspecified
// [cfe] unspecified

  C nc2 = .instance2;
  const C c2 = .instance2;
//             ^
// [analyzer] unspecified
// [cfe] unspecified

  ET net1 = .instance1;
  const ET et1 = .instance1;
//               ^
// [analyzer] unspecified
// [cfe] unspecified

  ET net2 = .instance2;
  const ET et2 = .instance2;
//               ^
// [analyzer] unspecified
// [cfe] unspecified
}

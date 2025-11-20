// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The semantics of the primary constructor is found in the
/// following steps, where `D` is the class, mixin class, extension type, or
/// enum declaration in the program that includes a primary constructor `k`, and
/// `D2` is the result of the derivation of the semantics of `D`. The derivation
/// step will delete elements that amount to the primary constructor.
/// Semantically, it will add a new constructor `k2`, and it will add zero or
/// more instance variable declarations.
/// ...
/// The formal parameter list `L2` of `k2` is identical to `L`, except that each
/// formal parameter is processed as follows.
///
/// The formal parameters in `L` and `L2` occur in the same order, and mandatory
/// positional parameters remain mandatory, and named parameters preserve the
/// name and the modifier `required`, if any. An optional positional or named
/// parameter remains optional; if it has a default value `d` in `L` then it has
/// the default value `d` in `L2` as well.
///
/// @description Check that mandatory positional parameters in `L` remain
/// mandatory in `L2` and it is a compile-time error to invoke `k2` with any
/// missing parameter.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

class C(final int v1, var String v2, this.v3) {
  bool v3;
}

extension type ET(int v1);

enum E(final int v1, this.v2, final bool v3) {
  e0(1, "two");
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  final String v2;
}

main() {
  C();
// ^
// [analyzer] unspecified
// [cfe] unspecified
  C(1);
// ^
// [analyzer] unspecified
// [cfe] unspecified
  C(1, "two");
// ^
// [analyzer] unspecified
// [cfe] unspecified

  ET();
//  ^
// [analyzer] unspecified
// [cfe] unspecified
}

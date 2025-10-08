// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The semantics of the declaring constructor is found in the
/// following steps, where `D` is the class, extension type, or enum declaration
/// in the program that includes a declaring constructor `k`, and `D2` is the
/// result of the derivation of the semantics of `D`. The derivation step will
/// delete elements that amount to the declaring constructor. Semantically, it
/// will add a new constructor `k2`, and it will add zero or more instance
/// variable declarations.
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

// SharedOptions=--enable-experiment=declaring-constructors

class C1(final int v1, var String v2, this.v3) {
  bool v3;
}

class C2 {
  String v2;
  this(final int v1, String v2, var bool v3) : this.v2 = v2;
}

extension type ET1(int v1);

extension type ET2 {
  this(int v1, final String v2, bool v3) {}
}

enum E1(final int v1, this.v2, final bool v3) {
  e0(1, "two");
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  final String v2;
}

enum E2 {
  e0(1, "two");
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  final String v3;
  const this(final int v1, final String v2, this.v3);
}

main() {
  C1();
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  C1(1);
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  C1(1, "two");
//  ^
// [analyzer] unspecified
// [cfe] unspecified

  C2();
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  C2(1);
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  C2(1, "two");
//  ^
// [analyzer] unspecified
// [cfe] unspecified

  ET1();
  // ^
  // [analyzer] unspecified
  // [cfe] unspecified

  ET2();
//   ^
// [analyzer] unspecified
// [cfe] unspecified
  ET2(1);
//   ^
// [analyzer] unspecified
// [cfe] unspecified
  ET2(1, "two");
//   ^
// [analyzer] unspecified
// [cfe] unspecified
}

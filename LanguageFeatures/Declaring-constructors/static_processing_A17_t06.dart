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
/// @description Check that required named parameters in `L` and `L2` remain
/// required and it is a compile-time error to invoke `k2` with any missing
/// required parameter.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=declaring-constructors

class C1({required this.v1, required var String v2, required final bool v3}) {
  int v1;
}

class C2 {
  String v2;
  this({required final int v1, required String v2, required var bool v3})
      : this.v2 = v2;
}

extension type ET1({required int v1});

extension type ET2 {
  this({required int v1, required final String v2, required bool v3}) {}
}

enum E1({required final int v1, required this.v2, required final bool v3}) {
  e0(v2: "2", v3: false);
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  final String v2;
}

enum E2 {
  e0(v1: 42, v2: "2");
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  final String v2;
  const this({
    required final int v1,
    required String v2,
    required final bool v3}) : this.v2 = v2;
}

main() {
  C1(v1: 1, v3: true);
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  C1(v1: 1, v2: "two");
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  C1(v2: "two", v3: true);
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  C2(v1: 1, v3: true);
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  C2(v1: 1, v2: "two");
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  C2(v2: "two", v3: true);
//  ^
// [analyzer] unspecified
// [cfe] unspecified

  ET1();
//   ^
// [analyzer] unspecified
// [cfe] unspecified

  ET2(v1: 1, v3: true);
//   ^
// [analyzer] unspecified
// [cfe] unspecified
  ET2(v1: 1, v2: "two");
//   ^
// [analyzer] unspecified
// [cfe] unspecified
  ET2(v2: "two", v3: true);
//   ^
// [analyzer] unspecified
// [cfe] unspecified
}

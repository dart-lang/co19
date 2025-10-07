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
/// @description Check that the formal parameters in `L` and `L2` occur in the
/// same order, and optional named parameters remain optional and preserve their
/// names.
/// @author sgrekhov22@gmail.com

// TODO (sgrekhov) Add `declaring-constructors` experimental flag

import '../../Utils/expect.dart';

String log = "";

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
  this({required int v1, required final String v2, required bool v3}) {
    log = "v1=$v1;v3=$v3";
  }
}

enum E1({required final int v1, required this.v2, required final bool v3}) {
  e0(v1: 42, v2: "2", v3: false);
  final String v2;
}

enum E2 {
  e1(v1: 42, v2: "2", v3: false);
  final String v2;
  const this({
    required final int v1,
    required String v2,
    required final bool v3}) : this.v2 = v2;
}

main() {
  Expect.isTrue(C1.new is
      C1 Function({required int v1, required String v2, required bool v3}));
  var c1 = C1(v1: 42, v2: "2", v3: false);
  Expect.equals(42, c1.v1);
  Expect.equals("2", c1.v2);
  Expect.isFalse(c1.v3);

  Expect.isTrue(C2.new is
      C2 Function({required int v1, required String v2, required bool v3}));
  var c2 = C2(v1: 42, v2: "two", v3: false);
  Expect.equals(42, c2.v1);
  Expect.equals("two", c2.v2);
  Expect.isFalse(c2.v3);

  Expect.isTrue(ET1.new is ET1 Function({required int v1}));
  var et1 = ET1(v1: 42);
  Expect.equals(42, et1.v1);

  Expect.isTrue(ET2.new is
      ET2 Function({required  int v1, required String v2, required bool v3}));
  var et2 = ET2(42, "2", false);
  Expect.equals("2", et2.v2);
  Expect.equals("v1=42;v3=false", log);

  Expect.equals(1, E1.e0.v1);
  Expect.equals("two", E1.e0.v2);
  Expect.isTrue(E1.e0.v3);
  Expect.equals(42, E1.e1.v1);
  Expect.equals("2", E1.e1.v2);
  Expect.isFalse(E1.e1.v3);

  Expect.equals(1, E2.e0.v1);
  Expect.equals("two", E2.e0.v2);
  Expect.isTrue(E2.e0.v3);
  Expect.equals(42, E2.e1.v1);
  Expect.equals("2", E2.e1.v2);
  Expect.isFalse(E2.e1.v3);
}

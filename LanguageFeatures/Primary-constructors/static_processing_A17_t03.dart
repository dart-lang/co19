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
/// @description Check that optional named parameters in `L` and `L2` remain
/// optional and preserve their names and default values.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

import '../../Utils/expect.dart';

class C({this.v1 = 1, var String v2 = "two", final bool v3 = true}) {
  int v1;
}

extension type ET({int v1 = 0});

enum E({final int v1 = 1, this.v2 = "two", final bool v3 = true}) {
  e0, e1(v1: 42, v2: "2", v3: false);
  final String v2;
}

main() {
  Expect.isTrue(C.new is C Function({int v1, String v2, bool v3}));
  var c = C(v1: 42, v2: "2", v3: false);
  Expect.equals(42, c.v1);
  Expect.equals("2", c.v2);
  Expect.isFalse(c.v3);

  c = C();
  Expect.equals(1, c.v1);
  Expect.equals("two", c.v2);
  Expect.isTrue(c.v3);

  Expect.isTrue(ET.new is ET Function({int v1}));
  var et = ET(v1: 42);
  Expect.equals(42, et.v1);
  et = ET();
  Expect.equals(0, et.v1);

  Expect.equals(1, E.e0.v1);
  Expect.equals("two", E.e0.v2);
  Expect.isTrue(E.e0.v3);
  Expect.equals(42, E.e1.v1);
  Expect.equals("2", E.e1.v2);
  Expect.isFalse(E.e1.v3);
}

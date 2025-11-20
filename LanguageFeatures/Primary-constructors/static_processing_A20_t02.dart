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
/// ...
/// A formal parameter which is not covered by the previous two cases and which
/// does not have the modifier `var` or the modifier `final` is copied unchanged
/// from `L` to `L2` (this is a plain, non-declaring parameter).
///
/// @description Check that the value of an actual argument of a plain,
/// non-declaring parameter is treated in a way that corresponds to the
/// parameter declaration being the same in `k` and in `k2`. Test optional
/// positional parameters.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

import '../../Utils/expect.dart';

class C1<T>([String v1 = "default", T? v2]) {
  String x1;
  T? x2;
  this : this.x1 = v1, x2 = v2;
}

class C2([String v1 = "default", int v2 = 2]) {
  String x1;
  int x2;
  this : this.x1 = v1, x2 = v2;
}

enum E1<T>([T? t]) {
  e0<String>("E1"), e1;
  final T? v;
  this: v = t;
}

enum E2([String s = "default"]) {
  e0("E2"), e1;
  final String v;
  this : v = s;
}

main() {
  var c1 = C1<int>("v1", -2);
  Expect.equals("v1", c1.x1);
  Expect.equals(-2, c1.x2);
  c1 = C1<int>();
  Expect.equals("default", c1.x1);
  Expect.isNull(c1.x2);

  var c2 = C2("v1", -2);
  Expect.equals("v1", c2.x1);
  Expect.equals(-2, c2.x2);
  c2 = C2();
  Expect.equals("default", c2.x1);
  Expect.equals(2, c2.x2);

  Expect.equals("E1", E1.e0.v);
  Expect.isNull(E1.e1.v);
  Expect.equals("E2", E2.e0.v);
  Expect.equals("default", E2.e1.v);
}

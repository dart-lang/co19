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
/// A formal parameter which is not covered by the previous two cases and which
/// does not have the modifier `var` or the modifier `final` is copied unchanged
/// from `L` to `L2` (this is a plain, non-declaring parameter).
///
/// @description Check that the value of an actual argument of a plain,
/// non-declaring parameter is treated in a way that corresponds to the
/// parameter declaration being the same in `k` and in `k2`. Test optional named
/// parameters.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=declaring-constructors

import '../../Utils/expect.dart';

String log = "";

class C1<T>({String v1 = "default", T? v2}) {
  String x1;
  T? x2;
  this : this.x1 = v1, x2 = v2;
}

class C2({String v1 = "default", int v2 = 2}) {
  String x1;
  int x2;
  this : this.x1 = v1, x2 = v2;
}

class C3<T> {
  String x1;
  T? x2;
  this({String v1 = "default", T? v2}) : this.x1 = v1, x2 = v2;
}

class C4 {
  String x1;
  int x2;
  this({String v1 = "default", T v2 = 2}) : this.x1 = v1, x2 = v2;
}

extension type ET1<T> {
  this(final int v, {T? t}) {
    log = "$t";
  }
}

extension type ET2 {
  this(final int v, {String s = "default"}) {
    log = s;
  }
}

enum E1<T>({T? t}) {
  e0<String>(t: "E1"), e1;
  final T? v;
  this: v = t;
}

enum E2({String s = "default"}) {
  e0(s: "E2"), e1;
  final String v;
  this : v = s;
}

enum E3<T> {
  e0<String>(t: "E3"), e1;
  final T? v;
  const this({T? t}) : v = t;
}

enum E4 {
  e0(s: "E4"), e1;
  final String v;
  const this({String s = "default"}) : v = s;
}

main() {
  var c1 = C1<int>(v1: "v1", v2: -2);
  Expect.equals("v1", c1.x1);
  Expect.equals(-2, c1.x2);
  c1 = C1<int>();
  Expect.equals("default", c1.x1);
  Expect.isNull(c1.x2);

  var c2 = C2(v1: "v1", v2: -2);
  Expect.equals("v1", c2.x1);
  Expect.equals(-2, c2.x2);
  c2 = C2();
  Expect.equals("default", c2.x1);
  Expect.isNull(c2.x2);

  var c3 = C3<int>(v1: "v1", v2: -2);
  Expect.equals("v1", c3.x1);
  Expect.equals(-2, c3.x2);
  c3 = C3<int>();
  Expect.equals("default", c3.x1);
  Expect.isNull(c3.x2);

  var c4 = C4(v1: "v1", v2: -2);
  Expect.equals("v1", c4.x1);
  Expect.equals(-2, c4.x2);
  c4 = C4();
  Expect.equals("default", c4.x1);
  Expect.isNull(c4.x2);

  var et1 = ET1<String>(1, t: "ET1");
  Expect.equals(1, et1.v);
  Expect.equals("ET1", log);
  et1 = ET1<String>(2);
  Expect.equals(2, et1.v);
  Expect.equals("${null}", log);

  var et2 = ET2(1, s: "ET2");
  Expect.equals(1, et2.v);
  Expect.equals("ET2", log);
  et2 = ET2(2);
  Expect.equals(2, et2.v);
  Expect.equals("default", log);

  Expect.equals("E1", E1.e0.v);
  Expect.equals("default", E1.e1.v);
  Expect.equals("E2", E2.e0.v);
  Expect.equals("default", E2.e1.v);
  Expect.equals("E3", E3.e0.v);
  Expect.equals("default", E3.e1.v);
  Expect.equals("E4", E4.e0.v);
  Expect.equals("default", E4.e1.v);
}

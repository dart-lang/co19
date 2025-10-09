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
/// Otherwise, a formal parameter (named or positional) of the form` var T p` or
/// `final T p` where `T` is a type and `p` is an identifier is replaced in `L2`
/// by `this.p`, along with its default value, if any. Next, a semantic instance
/// variable declaration corresponding to the syntax `T p;` or `final T p;` is
/// added to `D2`. It includes the modifier `final` if the parameter in `L` has
/// the modifier `final`, or `D` is an extension type declaration and `k` is a
/// declaring header constructor. In all cases, if `p` has the modifier
/// `covariant` then this modifier is removed from the parameter in `L2`, and it
/// is added to the instance variable declaration named `p`.
///
/// @description Check that a formal parameter of the form `var T p` and
/// `final T p` where `T` is a type and `p` is an identifier is replaced in `L2`
/// by `this.p` and a semantic instance variable declaration corresponding to
/// the syntax `T p;` or `final T p;` is added to `D2`. Test optional named
/// parameters.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=declaring-constructors

import '../../Utils/expect.dart';

class C1<T>({var String v1 = "default", final T? v2});

class C2({final String v1 = "default", var int v2 = 0});

class C3<T> {
  this({final String v1 = "default", var T? v2});
}

class C4 {
  this({var String v1 = "default", final int v2 = 0});
}

extension type ET1<T>({final T? v});

extension type ET2({String v = "default"});

extension type ET3<T> {
  this({T? t});
}

extension type ET4 {
  this({final String v = "default"});
}

enum E1<T>({final T? v}) {
  e0<String>(v: "E1"), e1;
}

enum E2({final String v = "default"}) {
  e0(v: "E2"), e1;
}

enum E3<T> {
  e0<String>(v: "E3"), e1;
  const this({final T? v});
}

enum E4 {
  e0(v: "E4"), e1;
  const this({final String v = "default"});
}

main() {
  var c1 = C1<int>(v1: "C1", v2: 2);
  Expect.equals("C1", c1.v1);
  Expect.equals(2, c1.v2);
  c1 = C1<int>();
  Expect.equals("default", c1.v1);
  Expect.isNull(c1.v2);

  var c2 = C2(v1: "C2", v2: 2);
  Expect.equals("C2", c2.v1);
  Expect.equals(2, c2.v2);
  c2 = C2<int>();
  Expect.equals("default", c2.v1);
  Expect.equals(0, c2.v2);

  var c3 = C3<int>(v1: "C3", v2: 2);
  Expect.equals("C3", c3.v1);
  Expect.equals(2, c3.v2);
  c3 = C3<int>();
  Expect.equals("default", c3.v1);
  Expect.isNull(c3.v2);

  var c4 = C4(v1: "C4", v2: 2);
  Expect.equals("C4", c4.v1);
  Expect.equals(2, c4.v2);
  c4 = C4<int>();
  Expect.equals("default", c4.v1);
  Expect.equals(0, c4.v2);

  var et1 = ET1<String>(v: "ET1");
  Expect.equals("ET1", et1.v);
  et1 = ET1<String>();
  Expect.isNull(et1.v);

  var et2 = ET2(v: "ET2");
  Expect.equals("ET2", et2.v);
  et2 = ET2();
  Expect.equals("default", et2.v);

  var et3 = ET3<String>(v: "ET3");
  Expect.equals("ET3", et3.v);
  et3 = ET1<String>();
  Expect.isNull(et3.v);

  var et4 = ET4(v: "ET4");
  Expect.equals("ET4", et4.v);
  et4 = ET4();
  Expect.equals("default", et4.v);

  Expect.equals("E1", E1.e0.v);
  Expect.isNull(E1.e1.v);
  Expect.equals("E2", E2.e0.v);
  Expect.equals("default", E2.e1.v);
  Expect.equals("E3", E3.e0.v);
  Expect.isNull(E3.e1.v);
  Expect.equals("E4", E4.e0.v);
  Expect.equals("default", E4.e1.v);
}

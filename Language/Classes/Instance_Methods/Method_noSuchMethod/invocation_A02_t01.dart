// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A noSuchMethod forwarder is a concrete member of C with the
/// signature taken from the interface of C, and with the same default value for
/// each optional parameter. It can be invoked in an ordinary invocation and in
/// a superinvocation, and when m is a method it can be closurized using a
/// property extraction.
///
/// @description Checks that when a `noSuchMethod` forwarder is a method it can
/// be closurized using a property extraction
/// @author sgrekhov22@gmail.com

import "../../../../Utils/expect.dart";
import "../../../../Utils/static_type_helper.dart";

mixin class A {
  int m1(int v, [String s = "s1"]);

  int m2(int v, {String s});

  int m3(int v, {required String s});

  int m4(int v, [covariant String s]);

  dynamic noSuchMethod(Invocation inv) {
    return 42;
  }
}

class C1 extends A {}

class C2 with A {}

mixin M on A {}

class MA = A with M;

enum E with A {
  e1, e2;
}

main() {
  var a1 = A().m1;
  a1.expectStaticType<Exactly<int Function(int, [String])>>();
  Expect.equals(42, a1(1, "1"));

  var a2 = A().m2;
  a2.expectStaticType<Exactly<int Function(int, {String s})>>();
  Expect.equals(42, a2(1, s: "1"));

  var a3 = A().m3;
  a3.expectStaticType<Exactly<int Function(int, {required String s})>>();
  Expect.equals(42, a3(1, s: "1"));

  var a4 = A().m4;
  a4.expectStaticType<Exactly<int Function(int, [String s])>>();
  Expect.equals(42, a4(1, "1"));

  var c11 = C1().m1;
  c11.expectStaticType<Exactly<int Function(int, [String])>>();
  Expect.equals(42, c11(1, "1"));

  var c12 = C1().m2;
  c12.expectStaticType<Exactly<int Function(int, {String s})>>();
  Expect.equals(42, c12(1, s: "1"));

  var c13 = C1().m3;
  c13.expectStaticType<Exactly<int Function(int, {required String s})>>();
  Expect.equals(42, c13(1, s: "1"));

  var c14 = C1().m4;
  c14.expectStaticType<Exactly<int Function(int, [String s])>>();
  Expect.equals(42, c14(1, "1"));

  var c21 = C2().m1;
  c21.expectStaticType<Exactly<int Function(int, [String])>>();
  Expect.equals(42, c21(1, "1"));

  var c22 = C2().m2;
  c22.expectStaticType<Exactly<int Function(int, {String s})>>();
  Expect.equals(42, c22(1, s: "1"));

  var c23 = C2().m3;
  c23.expectStaticType<Exactly<int Function(int, {required String s})>>();
  Expect.equals(42, c23(1, s: "1"));

  var c24 = C2().m4;
  c24.expectStaticType<Exactly<int Function(int, [String s])>>();
  Expect.equals(42, c24(1, "1"));

  var m1 = MA().m1;
  m1.expectStaticType<Exactly<int Function(int, [String])>>();
  Expect.equals(42, m1(1, "1"));

  var m2 = MA().m2;
  m2.expectStaticType<Exactly<int Function(int, {String s})>>();
  Expect.equals(42, m2(1, s: "1"));

  var m3 = MA().m3;
  m3.expectStaticType<Exactly<int Function(int, {required String s})>>();
  Expect.equals(42, m3(1, s: "1"));

  var m4 = MA().m4;
  m4.expectStaticType<Exactly<int Function(int, [String s])>>();
  Expect.equals(42, m4(1, "1"));

  var e1 = E.e1.m1;
  e1.expectStaticType<Exactly<int Function(int, [String])>>();
  Expect.equals(42, e1(1, "1"));

  var e2 = E.e2.m2;
  e2.expectStaticType<Exactly<int Function(int, {String s})>>();
  Expect.equals(42, e2(1, s: "1"));

  var e3 = E.e1.m3;
  e3.expectStaticType<Exactly<int Function(int, {required String s})>>();
  Expect.equals(42, e3(1, s: "1"));

  var e4 = E.e2.m4;
  e4.expectStaticType<Exactly<int Function(int, [String s])>>();
  Expect.equals(42, e4(1, "1"));

}

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

abstract mixin class A {
  String m1(int v, [String s = "s1"]);

  String m2(int v, {String s});

  String m3(int v, {required String s});

  String m4(int v, [covariant String s]);
}

class C1 extends A {
  dynamic noSuchMethod(Invocation inv) {
    return "C1";
  }
}

class C2 with A {
  dynamic noSuchMethod(Invocation inv) {
    return "C2";
  }
}

mixin M on A {
  dynamic noSuchMethod(Invocation inv) {
    return "M";
  }
}

class MA = A with M;

enum E with A {
  e1, e2;
  dynamic noSuchMethod(Invocation inv) {
    return "E";
  }
}

main() {
  var c11 = C1().m1;
  c11.expectStaticType<Exactly<String Function(int, [String])>>();
  Expect.equals("C1", c11(1, "1"));

  var c12 = C1().m2;
  c12.expectStaticType<Exactly<String Function(int, {String s})>>();
  Expect.equals("C1", c12(1, s: "1"));

  var c13 = C1().m3;
  c13.expectStaticType<Exactly<String Function(int, {required String s})>>();
  Expect.equals("C1", c13(1, s: "1"));

  var c14 = C1().m4;
  c14.expectStaticType<Exactly<String Function(int, [String s])>>();
  Expect.equals("C1", c14(1, "1"));

  var c21 = C2().m1;
  c21.expectStaticType<Exactly<String Function(int, [String])>>();
  Expect.equals("C2", c21(1, "1"));

  var c22 = C2().m2;
  c22.expectStaticType<Exactly<String Function(int, {String s})>>();
  Expect.equals("C2", c22(1, s: "1"));

  var c23 = C2().m3;
  c23.expectStaticType<Exactly<String Function(int, {required String s})>>();
  Expect.equals("C2", c23(1, s: "1"));

  var c24 = C2().m4;
  c24.expectStaticType<Exactly<String Function(int, [String s])>>();
  Expect.equals("C2", c24(1, "1"));

  var m1 = MA().m1;
  m1.expectStaticType<Exactly<String Function(int, [String])>>();
  Expect.equals("M", m1(1, "1"));

  var m2 = MA().m2;
  m2.expectStaticType<Exactly<String Function(int, {String s})>>();
  Expect.equals("M", m2(1, s: "1"));

  var m3 = MA().m3;
  m3.expectStaticType<Exactly<String Function(int, {required String s})>>();
  Expect.equals("M", m3(1, s: "1"));

  var m4 = MA().m4;
  m4.expectStaticType<Exactly<String Function(int, [String s])>>();
  Expect.equals("M", m4(1, "1"));

  var e1 = E.e1.m1;
  e1.expectStaticType<Exactly<String Function(int, [String])>>();
  Expect.equals("E", e1(1, "1"));

  var e2 = E.e2.m2;
  e2.expectStaticType<Exactly<String Function(int, {String s})>>();
  Expect.equals("E", e2(1, s: "1"));

  var e3 = E.e1.m3;
  e3.expectStaticType<Exactly<String Function(int, {required String s})>>();
  Expect.equals("E", e3(1, s: "1"));

  var e4 = E.e2.m4;
  e4.expectStaticType<Exactly<String Function(int, [String s])>>();
  Expect.equals("E", e4(1, "1"));

}

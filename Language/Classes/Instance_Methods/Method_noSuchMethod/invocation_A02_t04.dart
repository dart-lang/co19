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
/// @issue 53677

import "../../../../Utils/expect.dart";
import "../../../../Utils/static_type_helper.dart";

class C {
  String m1(int v, [String s = "s1"]);

  String m2(int v, {String s});

  String m3(int v, {required String s});

  String m4(int v, [covariant String s]);

  dynamic noSuchMethod(Invocation inv) {
    return "C1";
  }
}

mixin M {
  String m1(int v, [String s = "s1"]);

  String m2(int v, {String s});

  String m3(int v, {required String s});

  String m4(int v, [covariant String s]);

  dynamic noSuchMethod(Invocation inv) {
    return "M";
  }
}

class MA = Object with M;

enum E {
  e1, e2;
  String m1(int v, [String s = "s1"]);

  String m2(int v, {String s});

  String m3(int v, {required String s});

  String m4(int v, [covariant String s]);

  dynamic noSuchMethod(Invocation inv) {
    return "E";
  }
}

main() {
  var c1 = C().m1;
  c1.expectStaticType<Exactly<String Function(int, [String])>>();
  Expect.equals("C1", c1(1, "1"));

  var c2 = C().m2;
  c2.expectStaticType<Exactly<String Function(int, {String s})>>();
  Expect.equals("C1", c2(1, s: "1"));

  var c3 = C().m3;
  c3.expectStaticType<Exactly<String Function(int, {required String s})>>();
  Expect.equals("C1", c3(1, s: "1"));

  var c4 = C().m4;
  c4.expectStaticType<Exactly<String Function(int, [String s])>>();
  Expect.equals("C1", c4(1, "1"));

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

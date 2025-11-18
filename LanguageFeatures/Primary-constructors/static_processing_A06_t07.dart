// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The declaring parameter list of the primary constructor
/// introduces a new scope, the primary initializer scope, whose enclosing scope
/// is the body scope of D. Each of the parameters in said parameter list is
/// introduced into this scope.
///
/// The same parameter list also introduces the primary parameter scope, whose
/// enclosing scope is also the body scope of the class. Every primary parameter
/// which is not declaring, not initializing, and not a super parameter is
/// introduced into this scope.
///
/// The primary initializer scope is the current scope for the initializing
/// expression, if any, of each non-late instance variable declaration. It is
/// also the current scope for the initializer list in the body part of the
/// primary constructor, if any.
///
/// The primary parameter scope is the current scope for the body of the body
/// part of the primary constructor, if any.
///
/// @description Check that the primary initializer scope is not the current
/// scope for a body of an instance method/getter/setter.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

import '../../Utils/expect.dart';

final String x = "top level";
String setterLog = "";

class C1(String x) {
  String instance = x;
  String method() => x;
  String get getter => x;
  void set setter(String _) {
    setterLog = x;
  }
}

class C2([String x = "default"]) {
  String instance = x;
  String method() => x;
  String get getter => x;
  void set setter(String _) {
    setterLog = x;
  }
}

class C3({String x = "default"}) {
  String instance = x;
  String method() => x;
  String get getter => x;
  void set setter(String _) {
    setterLog = x;
  }
}

class C4({required String x}) {
  String instance = x;
  String method() => x;
  String get getter => x;
  void set setter(String _) {
    setterLog = x;
  }
}

extension type ET1(String x) {
  String method() => x;
  String get getter => x;
  void set setter(String _) {
    setterLog = x;
  }
}

extension type ET2([String x = "default"]) {
  String method() => x;
  String get getter => x;
  void set setter(String _) {
    setterLog = x;
  }
}

extension type ET3({String x = "default"}) {
  String method() => x;
  String get getter => x;
  void set setter(String _) {
    setterLog = x;
  }
}

extension type ET4({required String x}) {
  String method() => x;
  String get getter => x;
  void set setter(String _) {
    setterLog = x;
  }
}

enum const E1(String x) {
  e0("E1");

  final String instance = x;
  String method() => x;
  String get getter => x;
  void set setter(String _) {
    setterLog = x;
  }
}

enum const E2([String x = "default"]) {
  e0("E2"), e1;

  final String instance = x;
  String method() => x;
  String get getter => x;
  void set setter(String _) {
    setterLog = x;
  }
}

enum const E3({String x = "default"}) {
  e0(x: "E3"), e1;

  final String instance = x;
  String method() => x;
  String get getter => x;
  void set setter(String _) {
    setterLog = x;
  }
}

enum const E4({required String x}) {
  e0(x: "E4");

  final String instance = x;
  String method() => x;
  String get getter => x;
  void set setter(String _) {
    setterLog = x;
  }
}

main() {
  var c1 = C1("parameter");
  Expect.equals("parameter", c1.instance);
  Expect.equals("top level", c1.method());
  Expect.equals("top level", c1.getter);
  c1.setter = "updated";
  Expect.equals("top level", setterLog);
  setterLog = "";

  var c2 = C2("parameter");
  Expect.equals("parameter", c2.instance);
  Expect.equals("top level", c2.method());
  Expect.equals("top level", c2.getter);
  c2.setter = "updated";
  Expect.equals("top level", setterLog);
  setterLog = "";

  c2 = C2();
  Expect.equals("default", c2.instance);
  Expect.equals("top level", c2.method());
  Expect.equals("top level", c2.getter);
  c2.setter = "updated";
  Expect.equals("top level", setterLog);
  setterLog = "";

  var c3 = C3(x: "parameter");
  Expect.equals("parameter", c3.instance);
  Expect.equals("top level", c3.method());
  Expect.equals("top level", c3.getter);
  c3.setter = "updated";
  Expect.equals("top level", setterLog);
  setterLog = "";

  c3 = C3();
  Expect.equals("default", c3.instance);
  Expect.equals("top level", c3.method());
  Expect.equals("top level", c3.getter);
  c3.setter = "updated";
  Expect.equals("top level", setterLog);
  setterLog = "";

  var c4 = C4(x: "parameter");
  Expect.equals("parameter", c4.instance);
  Expect.equals("top level", c4.method());
  Expect.equals("top level", c4.getter);
  c4.setter = "updated";
  Expect.equals("top level", setterLog);
  setterLog = "";

  var et1 = ET1("parameter");
  Expect.equals("top level", et1.method());
  Expect.equals("top level", et1.getter);
  et1.setter = "updated";
  Expect.equals("top level", setterLog);
  setterLog = "";

  var et2 = ET2("parameter");
  Expect.equals("top level", et2.method());
  Expect.equals("top level", et2.getter);
  et2.setter = "updated";
  Expect.equals("top level", setterLog);
  setterLog = "";

  et2 = ET2();
  Expect.equals("top level", et2.method());
  Expect.equals("top level", et2.getter);
  et2.setter = "updated";
  Expect.equals("top level", setterLog);
  setterLog = "";

  var et3 = ET3(x: "parameter");
  Expect.equals("top level", et3.method());
  Expect.equals("top level", et3.getter);
  et3.setter = "updated";
  Expect.equals("top level", setterLog);
  setterLog = "";

  et3 = ET3();
  Expect.equals("top level", et3.method());
  Expect.equals("top level", et3.getter);
  et3.setter = "updated";
  Expect.equals("top level", setterLog);
  setterLog = "";

  var et4 = ET4(x: "parameter");
  Expect.equals("top level", et4.method());
  Expect.equals("top level", et4.getter);
  et4.setter = "updated";
  Expect.equals("top level", setterLog);
  setterLog = "";

  Expect.equals("E1", E1.e0.instance);
  Expect.equals("top level", E1.e0.method());
  Expect.equals("top level", E1.e0.getter);
  E1.e0.setter = "updated";
  Expect.equals("top level", setterLog);
  setterLog = "";

  Expect.equals("E2", E2.e0.instance);
  Expect.equals("top level", E2.e0.method());
  Expect.equals("top level", E2.e0.getter);
  E2.e0.setter = "updated";
  Expect.equals("top level", setterLog);
  setterLog = "";

  Expect.equals("default", E2.e1.instance);
  Expect.equals("top level", E2.e1.method());
  Expect.equals("top level", E2.e1.getter);
  E2.e1.setter = "updated";
  Expect.equals("top level", setterLog);
  setterLog = "";

  Expect.equals("E3", E3.e0.instance);
  Expect.equals("top level", E3.e0.method());
  Expect.equals("top level", E3.e0.getter);
  E3.e0.setter = "updated";
  Expect.equals("top level", setterLog);
  setterLog = "";

  Expect.equals("default", E3.e1.instance);
  Expect.equals("top level", E3.e1.method());
  Expect.equals("top level", E3.e1.getter);
  E3.e1.setter = "updated";
  Expect.equals("top level", setterLog);
  setterLog = "";

  Expect.equals("E4", E4.e0.instance);
  Expect.equals("top level", E4.e0.method());
  Expect.equals("top level", E4.e0.getter);
  E4.e0.setter = "updated";
  Expect.equals("top level", setterLog);
  setterLog = "";
}

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
/// scope for the initializing expression of a late static variable declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=declaring-constructors

import '../../Utils/expect.dart';

String x = "top level";

class C1(var String x) {
  String instance = x;
  static late String staticLateVariable = x;
}

class C2([String x = "default"]) {
  String instance = x;
  static late String staticLateVariable = x;
}

class C3({final String x = "default"}) {
  String instance = x;
  static late String staticLateVariable = x;
}

class C4({required String x}) {
  String instance = x;
  static late String staticLateVariable = x;
}

extension type ET1(String x) {
  static late String staticVariable = x;
}

extension type ET2([String x = "default"]) {
  static late String staticVariable = x;
}

extension type ET3({final String x = "default"}) {
  static late String staticVariable = x;
}

extension type ET4({required String x}) {
  static late String staticVariable = x;
}

enum const E1(String x) {
  e0("E1");
  static late String staticVariable = x;
}

enum const E2([String x = "default"]) {
  e0("E2");
  static late String staticVariable = x;
}

enum const E3({final String x = "default"}) {
  e0(x: "E3");
  static late String staticVariable = x;
}

enum const E4({required String x}) {
  e0(x: "E4");
  static late String staticVariable = x;
}

main() {
  var c1 = C1("parameter");
  Expect.equals("parameter", c1.instance);
  Expect.equals("top level", C1.staticLateVariable);

  var c2 = C2("parameter");
  Expect.equals("parameter", c2.instance);
  Expect.equals("top level", C2.staticLateVariable);
  c2 = C2();
  Expect.equals("default", c2.instance);
  Expect.equals("top level", C2.staticLateVariable);

  var c3 = C3(x: "parameter");
  Expect.equals("parameter", c3.instance);
  Expect.equals("top level", C3.staticLateVariable);
  c3 = C3();
  Expect.equals("default", c3.instance);
  Expect.equals("top level", C3.staticVariable);

  var c4 = C4(x: "parameter");
  Expect.equals("parameter", c4.instance);
  Expect.equals("top level", C4.staticLateVariable);

  var et1 = ET1("parameter");
  Expect.equals("top level", ET1.staticVariable);

  var et2 = ET2("parameter");
  Expect.equals("top level", ET2.staticVariable);
  et2 = ET2();
  Expect.equals("top level", ET2.staticVariable);

  var et3 = ET3(x: "parameter");
  Expect.equals("top level", ET3.staticVariable);
  et3 = ET3();
  Expect.equals("top level", ET3.staticVariable);

  var et4 = ET4(x: "parameter");
  Expect.equals("top level", ET4.staticVariable);

  Expect.equals("top level", E1.staticVariable);
  Expect.equals("top level", E2.staticVariable);
  Expect.equals("top level", E3.staticVariable);
  Expect.equals("top level", E4.staticVariable);
}

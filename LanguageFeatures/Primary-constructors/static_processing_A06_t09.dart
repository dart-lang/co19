// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
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
/// @description Check that the primary parameter scope is not the current
/// scope for the initializing expression of a static variable declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

import '../../Utils/expect.dart';

String x = "top level";

class C1(String x) {
  String instance = x;
  static String staticVariable = x;
}

class C2([String x = "default"]) {
  String instance = x;
  static String staticVariable = x;
}

class C3({String x = "default"}) {
  String instance = x;
  static String staticVariable = x;
}

class C4({required String x}) {
  String instance = x;
  static String staticVariable = x;
}

enum const E1(String x) {
  e0("E1");
  static String staticVariable = x;
}

enum const E2([String x = "default"]) {
  e0("E2");
  static String staticVariable = x;
}

enum const E3({String x = "default"}) {
  e0(x: "E3");
  static String staticVariable = x;
}

enum const E4({required String x}) {
  e0(x: "E4");
  static String staticVariable = x;
}

main() {
  var c1 = C1("parameter");
  Expect.equals("top level", c1.instance);
  Expect.equals("top level", C1.staticVariable);

  var c2 = C2("parameter");
  Expect.equals("top level", c2.instance);
  Expect.equals("top level", C2.staticVariable);
  c2 = C2();
  Expect.equals("top level", c2.instance);
  Expect.equals("top level", C2.staticVariable);

  var c3 = C3(x: "parameter");
  Expect.equals("top level", c3.instance);
  Expect.equals("top level", C3.staticVariable);
  c3 = C3();
  Expect.equals("top level", c3.instance);
  Expect.equals("top level", C3.staticVariable);

  var c4 = C4(x: "parameter");
  Expect.equals("top level", c4.instance);
  Expect.equals("top level", C4.staticVariable);

  Expect.equals("top level", E1.staticVariable);
  Expect.equals("top level", E2.staticVariable);
  Expect.equals("top level", E3.staticVariable);
  Expect.equals("top level", E4.staticVariable);
}

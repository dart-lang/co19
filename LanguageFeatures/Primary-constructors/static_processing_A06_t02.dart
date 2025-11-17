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
/// @description Check that the primary initializer scope is the current scope
/// for the initializing expression of non-late instance variable declaration
/// and it is also the current scope for the initializer list in the body part
/// of the primary constructor. Also check that the primary parameter scope is
/// the current scope for the initializer list in the body part of the primary
/// constructor. Test extension types.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=declaring-constructors

import '../../Utils/expect.dart';

String log = "";
String bodyLog = "";

extension type ET1(String x) {
  this : assert("${log=x}".isNotEmpty) {
    bodyLog = x;
  }
}

extension type ET2([String x = "default"]) {
  this : assert("${log=x}".isNotEmpty) {
    bodyLog = x;
  }
}

extension type ET3({String x = "default"}) {
  this : assert("${log=x}".isNotEmpty) {
    bodyLog = x;
  }
}

extension type ET4({required String x}) {
  this : assert("${log=x}".isNotEmpty) {
    bodyLog = x;
  }
}

main() {
  var et1 = ET1("parameter");
  Expect.equals("parameter", et1.x);
  if (log.isNotEmpty) {
    Expect.equals("parameter", log);
    log = "";
  }
  Expect.equals("parameter", bodyLog);
  bodyLog = "";

  var et2 = ET2("parameter");
  Expect.equals("parameter", et2.x);
  if (log.isNotEmpty) {
    Expect.equals("parameter", log);
    log = "";
  }
  Expect.equals("parameter", bodyLog);
  bodyLog = "";

  et2 = ET2();
  Expect.equals("default", et2.x);
  if (log.isNotEmpty) {
    Expect.equals("parameter", log);
    log = "";
  }
  Expect.equals("parameter", bodyLog);
  bodyLog = "";

  var et3 = ET3(x: "parameter");
  Expect.equals("parameter", et3.x);
  if (log.isNotEmpty) {
    Expect.equals("parameter", log);
    log = "";
  }
  Expect.equals("parameter", bodyLog);
  bodyLog = "";

  et3 = ET3();
  Expect.equals("default", et3.x);
  if (log.isNotEmpty) {
    Expect.equals("parameter", log);
    log = "";
  }
  Expect.equals("parameter", bodyLog);
  bodyLog = "";

  var et4 = ET4(x: "parameter");
  Expect.equals("parameter", et4.x);
  if (log.isNotEmpty) {
    Expect.equals("parameter", log);
    log = "";
  }
  Expect.equals("parameter", bodyLog);
  bodyLog = "";
}

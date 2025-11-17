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
/// constructor. Test classes.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=declaring-constructors

import '../../Utils/expect.dart';

class C1(var String x) {
  String Function() captureAtDeclaration = () => x;
  String Function() captureInInitializer;
  String Function()? captureInBody;

  this : captureInInitializer = (() => x) {
    captureInBody = () => x;
  }
}

class C2([var String x = "default"]) {
  String Function() captureAtDeclaration = () => x;
  String Function() captureInInitializer;
  String Function()? captureInBody;

  this : captureInInitializer = (() => x) {
    captureInBody = () => x;
  }
}

class C3({var String x = "default"}) {
  String Function() captureAtDeclaration = () => x;
  String Function() captureInInitializer;
  String Function()? captureInBody;

  this : captureInInitializer = (() => x) {
    captureInBody = () => x;
  }
}

class C4({required var String x}) {
  String Function() captureAtDeclaration = () => x;
  String Function() captureInInitializer;
  String Function()? captureInBody;

  this : captureInInitializer = (() => x) {
    captureInBody = () => x;
  }
}

main() {
  var c1 = C1("parameter");
  c1.x = "updated";
  Expect.equals("parameter", c1.captureAtDeclaration());
  Expect.equals("parameter", c1.captureInInitializer());
  Expect.equals("updated", c1.captureInBody!());

  var c2 = C2();
  c2.x = "updated";
  Expect.equals("default", c2.captureAtDeclaration());
  Expect.equals("default", c2.captureInInitializer());
  Expect.equals("updated", c2.captureInBody!());

  c2 = C2("parameter");
  c2.x = "updated";
  Expect.equals("parameter", c2.captureAtDeclaration());
  Expect.equals("parameter", c2.captureInInitializer());
  Expect.equals("updated", c2.captureInBody!());

  var c3 = C3();
  c3.x = "updated";
  Expect.equals("default", c3.captureAtDeclaration());
  Expect.equals("default", c3.captureInInitializer());
  Expect.equals("updated", c3.captureInBody!());

  c3 = C3(x: "parameter");
  c3.x = "updated";
  Expect.equals("parameter", c3.captureAtDeclaration());
  Expect.equals("parameter", c3.captureInInitializer());
  Expect.equals("updated", c3.captureInBody!());

  var c4 = C4(x: "parameter");
  c4.x = "updated";
  Expect.equals("parameter", c4.captureAtDeclaration());
  Expect.equals("parameter", c4.captureInInitializer());
  Expect.equals("updated", c4.captureInBody!());
}

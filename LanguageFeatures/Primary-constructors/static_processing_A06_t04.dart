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
/// scope for the initializing expression of a late instance variable
/// declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

import '../../Utils/expect.dart';

String x = "top level";

class C1(var String x) {
  String instance = x;
  late String lateInstance = x;
}

class C2([final String x = "default"]) {
  String instance = x;
  late String lateInstance = x;
}

class C3({var String x = "default"}) {
  String instance = x;
  late String lateInstance = x;
}

class C4({required final String x}) {
  String instance = x;
  late String lateInstance = x;
}

main() {
  var c1 = C1("parameter");
  Expect.equals("parameter", c1.instance);
  Expect.equals("parameter", c1.lateInstance);

  var c2 = C2("parameter");
  Expect.equals("parameter", c2.instance);
  Expect.equals("parameter", c2.lateInstance);
  c2 = C2();
  Expect.equals("default", c2.instance);
  Expect.equals("default", c2.lateInstance);

  var c3 = C3(x: "parameter");
  Expect.equals("parameter", c3.instance);
  Expect.equals("parameter", c3.lateInstance);
  c3 = C3();
  Expect.equals("default", c3.instance);
  Expect.equals("default", c3.lateInstance);

  var c4 = C4(x: "parameter");
  Expect.equals("parameter", c4.instance);
  Expect.equals("parameter", c4.lateInstance);
}

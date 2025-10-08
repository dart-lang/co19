// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The declaring parameter list of the declaring header constructor
/// introduces a new scope, the primary initializer scope, whose enclosing scope
/// is the body scope of `D`. Every primary parameter is entered into this scope.
///
/// The same parameter list also introduces the primary parameter scope, whose
/// enclosing scope is also the body scope of the class. Every primary parameter
/// which is not declaring, not initializing, and not a super parameter is
/// entered into this scope.
///
/// The primary initializer scope is the current scope for the initializing
/// expression, if any, of each non-late instance variable declaration. It is
/// also the current scope for the initializer list in the body part of the
/// declaring header constructor, if any.
///
/// The primary parameter scope is the current scope for the body of the body
/// part of the declaring header constructor, if any.
///
/// @description Check that the declaring parameter list of the in-body
/// declaring constructor doesn't introduce the primary initializer scope.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=declaring-constructors

import '../../Utils/expect.dart';

class C1 {
  this(var String x) : captureInInitializer = (() => x) {
    captureInBody = () => x;
  }

  String Function() captureInInitializer;
  String Function()? captureInBody;
}

class C2 {
  this([final String x = "default"]) : captureInInitializer = (() => x) {
    captureInBody = () => x;
  }

  String Function() captureInInitializer;
  String Function()? captureInBody;
}

main() {
  var c1 = C1("parameter");
  c1.x = "updated";
  Expect.equals("parameter", c1.captureInInitializer());
  Expect.equals("updated", c1.captureInBody!());

  var c2 = C2("parameter");
  c2.x = "updated";
  Expect.equals("parameter", c2.captureInInitializer());
  Expect.equals("updated", c2.captureInBody!());

  c2 = C2();
  c2.x = "updated";
  Expect.equals("parameter", c2.captureInInitializer());
  Expect.equals("updated", c2.captureInBody!());
}

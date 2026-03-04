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
/// for the initializing expression of non-late instance variable declaration.
/// Test enums.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

import '../../Utils/expect.dart';

enum E1(final String x) {
  e0("parameter");

  final String captureAtDeclaration = x;
}

enum const E2([final String x = "default"]) {
  e0, e1("parameter");

  final String captureAtDeclaration = x;
}

enum E3({final String x = "default"}) {
  e0, e1(x: "parameter");

  final String captureAtDeclaration = x;
}

enum const E4({required final String x}) {
  e0(x: "parameter");

  final String captureAtDeclaration = x;
}

main() {
  Expect.equals("parameter", E1.e0.captureAtDeclaration);

  Expect.equals("default", E2.e0.captureAtDeclaration);
  Expect.equals("parameter", E2.e1.captureAtDeclaration);

  Expect.equals("default", E3.e0.captureAtDeclaration);
  Expect.equals("parameter", E3.e1.captureAtDeclaration);

  Expect.equals("parameter", E4.e0.captureAtDeclaration);
}

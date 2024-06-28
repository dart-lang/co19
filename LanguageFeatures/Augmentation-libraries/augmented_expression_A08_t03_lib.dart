// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Assume that the identifier augmented occurs such that the
/// outermost enclosing declaration is not an augmenting declaration. In this
/// case, the identifier is taken to be a reference to a declaration which is in
/// scope.
///
/// @description Checks that if an identifier `augmented` occurs such that the
/// outermost enclosing declaration is not an augmenting declaration then the
/// identifier is taken to be a reference to a declaration which is in scope.
/// Test a variable named `augmented`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmented_expression_A08_t03.dart';

String topLevelFunction() => augmented;

class C {
  static String staticMethod() => augmented;
  String instanceMethod() => augmented;
}

mixin M {
  static String staticMethod() => augmented;
  String instanceMethod() => augmented;
}

class MA = Object with M;

enum E {
  e1;

  static String staticMethod() => augmented;
  String instanceMethod() => augmented;
}

extension Ext on A {
  static String staticMethod() => augmented;
  String instanceMethod() => augmented;
}

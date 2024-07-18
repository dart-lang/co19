// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The exact result of an `augmented` expression depends on what is
/// being augmented, but it generally follows the same rules as any normal
/// identifier:
/// ...
/// - Augmenting setters: Within an augmenting setter `augmented` must be
///   followed by an `=` and will directly invoke the augmented setter. If
///   augmenting a variable with a setter, this will invoke the implicitly
///   induced setter from the augmented variable declaration.
///
/// @description Checks that within an augmenting setter `augmented=` invokes
/// the augmented setter and binds the right hand side of the assignment
/// expression to the given actual argument. Test a function literal.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmented_expression_A02_t23_lib.dart';

String _log = "";

void set augmented(String value) {
  _log = "Global setter augmented = $value, shouldn't be invoked";
}

void set topLevelSetter(String value) {
  _log = "topLevelSetter: $value";
}


class C {
  static void set staticSetter(String value) {
    _log = "C.staticSetter: $value";
  }
  void set instanceSetter(String value) {
    _log = "C.instanceSetter: $value";
  }
  void set augmented(String value) {
    _log = "Setter C.augmented = $value, shouldn't be invoked";
  }
}

mixin M {
  static void set staticSetter(String value) {
    _log = "M.staticSetter: $value";
  }
  void set instanceSetter(String value) {
    _log = "M.instanceSetter: $value";
  }
  void set augmented(String value) {
    _log = "Setter M.augmented = $value, shouldn't be invoked";
  }
}

enum E {
  e1;

  static void set staticSetter(String value) {
    _log = "E.staticSetter: $value";
  }
  void set instanceSetter(String value) {
    _log = "E.instanceSetter: $value";
  }
  void set augmented(String value) {
    _log = "Setter E.augmented = $value, shouldn't be invoked";
  }
}

class A {
  void set augmented(String value) {
    _log = "Setter A.augmented = $value, shouldn't be invoked";
  }
}

extension Ext on A {
  static void set staticSetter(String value) {
    _log = "Ext.staticSetter: $value";
  }
  void set instanceSetter(String value) {
    _log = "Ext.instanceSetter: $value";
  }
}

class MA = Object with M;

main() {
  topLevelSetter = "1";
  C.staticSetter = "2";
  C().instanceSetter = "3";
  M.staticSetter = "4";
  MA().instanceSetter = "5";
  E.staticSetter = "6";
  E.e1.instanceSetter = "7";
  Ext.staticSetter = "8";
  A().instanceSetter = "9";
}

// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The exact result of an `augmented` expression depends on what is
/// being augmented, but it generally follows the same rules as any normal
/// identifier:
/// ...
/// - Augmenting setters: Within an augmenting setter `augmented` must be
///   followed by an `=` and will directly invoke the augmented setter. If
///   augmenting a field with a setter, this will invoke the implicit setter
///   from the augmented field.
///
/// @description Checks that within an augmenting setter `augmented=` invokes
/// the implicit augmented setter.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmented_expression_A02_t02_lib.dart';
import '../../Utils/expect.dart';

String _log = "";

void set augmented(String value) {
  _log = "Global setter augmented = $value, shouldn't be invoked";
}

String topLevelVariable = "";

class C {
  static String staticVariable = "";
  String instanceVariable = "";
  static void set augmented(String value) {
    _log = "Setter C.augmented = $value, shouldn't be invoked";
  }
}

mixin M {
  static String staticVariable = "";
  String instanceVariable = "";
  static void set augmented(String value) {
    _log = "Setter M.augmented = $value, shouldn't be invoked";
  }
}

enum E {
  e1;
  static String staticVariable = "";
  static void set augmented(String value) {
    _log = "Setter E.augmented = $value, shouldn't be invoked";
  }
}

class A {}

extension Ext on A {
  static String staticVariable = "";
  static void set augmented(String value) {
    _log = "Setter Ext.augmented = $value, shouldn't be invoked";
  }
}

class MA = Object with M;

main() {
  topLevelVariable = "1";
  Expect.equals("Augmented: 1", _log);
  C.staticVariable = "2";
  Expect.equals("Augmented: 2", _log);
  C().instanceVariable = "3";
  Expect.equals("Augmented: 3", _log);
  M.staticVariable = "4";
  Expect.equals("Augmented: 4", _log);
  MA().instanceVariable = "5";
  Expect.equals("Augmented: 5", _log);
  E.staticVariable = "6";
  Expect.equals("Augmented: 6", _log);
  Ext.staticVariable = "7";
  Expect.equals("Augmented: 7", _log);
}

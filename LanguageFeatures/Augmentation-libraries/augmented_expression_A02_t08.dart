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
/// the augmented setter.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import '../../Utils/expect.dart';
part 'augmented_expression_A02_t08_lib.dart';

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
  static void set augmented(String value) {
    _log = "C.augmented = $value, shouldn't be invoked";
  }
}

mixin M {
  static void set staticSetter(String value) {
    _log = "M.staticSetter: $value";
  }
  void set instanceSetter(String value) {
    _log = "M.instanceSetter: $value";
  }
  static void set augmented(String value) {
    _log = "M.augmented = $value, shouldn't be invoked";
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
  static void set augmented(String value) {
    _log = "E.augmented = $value, shouldn't be invoked";
  }
}

class A {}

extension Ext on A {
  static void set staticSetter(String value) {
    _log = "Ext.staticSetter: $value";
  }
  void set instanceSetter(String value) {
    _log = "Ext.instanceSetter: $value";
  }
  static void set augmented(String value) {
    _log = "Ext.augmented = $value, shouldn't be invoked";
  }
}

extension type ET(int _) {
  static void set staticSetter(String value) {
    _log = "Ext.staticSetter: $value";
  }
  void set instanceSetter(String value) {
    _log = "Ext.instanceSetter: $value";
  }
  static void set augmented(String value) {
    _log = "Ext.augmented = $value, shouldn't be invoked";
  }
}

class MA = Object with M;

main() {
  topLevelSetter = "1";
  Expect.equals("Augmented: 1", _log);
  C.staticSetter = "2";
  Expect.equals("Augmented: 2", _log);
  C().instanceSetter = "3";
  Expect.equals("Augmented: 3", _log);
  M.staticSetter = "4";
  Expect.equals("Augmented: 4", _log);
  MA().instanceSetter = "5";
  Expect.equals("Augmented: 5", _log);
  E.staticSetter = "6";
  Expect.equals("Augmented: 6", _log);
  E.e1.instanceSetter = "7";
  Expect.equals("Augmented: 7", _log);
  Ext.staticSetter = "8";
  Expect.equals("Augmented: 8", _log);
  A().instanceSetter = "9";
  Expect.equals("Augmented: 9", _log);
  ET.staticSetter = "10";
  Expect.equals("Augmented: 10", _log);
  ET(0).instanceSetter = "11";
  Expect.equals("Augmented: 11", _log);
}

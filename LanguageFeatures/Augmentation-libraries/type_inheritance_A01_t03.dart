// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An augmenting declaration may have no type annotations for a
/// return type, variable type, parameter type, or type parameter bound type. In
/// the last case, that includes omitting the extends keyword. For a variable or
/// parameter, a var keyword may replace the type.
///
/// @description Check that augmenting declaration may have no type annotations
/// for a formal parameter type.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'type_inheritance_A01_t03_lib.dart';
import '../../Utils/expect.dart';

String _log = "";

void topLevelFunction(String v) {
  _log = "Original $v";
}
void set topLevelSetter(final String v) {
  _log = "Original $v";
}

class C {
  static void staticMethod(final String v) {
    _log = "Original $v";
  }
  static void set staticSetter(String v) {
    _log = "Original $v";
  }
  void instanceMethod(String v) {
    _log = "Original $v";
  }
  void set instanceSetter(final String v) {
    _log = "Original $v";
  }
}

mixin M {
  static void staticMethod(String v) {
    _log = "Original $v";
  }
  static void set staticSetter(final String v) {
    _log = "Original $v";
  }
  void instanceMethod(final String v) {
    _log = "Original $v";
  }
  void set instanceSetter(String v) {
    _log = "Original $v";
  }
}

enum E {
  e0;
  static void staticMethod(final String v) {
    _log = "Original $v";
  }
  static void set staticSetter(String v) {
    _log = "Original $v";
  }
  void instanceMethod(String v) {
    _log = "Original $v";
  }
  void set instanceSetter(final String v) {
    _log = "Original $v";
  }
}

class A {}

extension Ext on A {
  static void staticMethod(String v) {
    _log = "Original $v";
  }
  static void set staticSetter(final String v) {
    _log = "Original $v";
  }
  void instanceMethod(final String v) {
    _log = "Original $v";
  }
  void set instanceSetter(String v) {
    _log = "Original $v";
  }
}

extension type ET(int id) {
  static void staticMethod(final String v) {
    _log = "Original $v";
  }
  static void set staticSetter(String v) {
    _log = "Original $v";
  }
  void instanceMethod(String v) {
    _log = "Original $v";
  }
  void set instanceSetter(final String v) {
    _log = "Original $v";
  }
}

class MA = Object with M;

main() {
  topLevelFunction("x");
  Expect.equals("Augmented x", _log);
  topLevelSetter = "x";
  Expect.equals("Augmented x", _log);
  C.staticMethod("x");
  Expect.equals("Augmented x", _log);
  C.staticSetter = "x";
  Expect.equals("Augmented x", _log);
  C().instanceMethod("x");
  Expect.equals("Augmented x", _log);
  C().instanceSetter = "x";
  Expect.equals("Augmented x", _log);
  M.staticMethod("x");
  Expect.equals("Augmented x", _log);
  M.staticSetter = "x";
  Expect.equals("Augmented x", _log);
  MA().instanceMethod("x");
  Expect.equals("Augmented x", _log);
  MA().instanceSetter = "x";
  Expect.equals("Augmented x", _log);
  E.staticMethod("x");
  Expect.equals("Augmented x", _log);
  E.staticSetter = "x";
  Expect.equals("Augmented x", _log);
  E.e0.instanceMethod("x");
  Expect.equals("Augmented x", _log);
  E.e0.instanceSetter = "x";
  Expect.equals("Augmented x", _log);
  Ext.staticMethod("x");
  Expect.equals("Augmented x", _log);
  Ext.staticSetter = "x";
  Expect.equals("Augmented x", _log);
  A().instanceMethod("x");
  Expect.equals("Augmented x", _log);
  A().instanceSetter = "x";
  Expect.equals("Augmented x", _log);
  ET.staticMethod("x");
  Expect.equals("Augmented x", _log);
  ET.staticSetter = "x";
  Expect.equals("Augmented x", _log);
  ET(0).instanceMethod("x");
  Expect.equals("Augmented x", _log);
  ET(0).instanceSetter = "x";
  Expect.equals("Augmented x", _log);
}

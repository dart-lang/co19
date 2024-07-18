// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An augmenting declaration may have no type annotations for a
/// return type, variable type, parameter type, or type parameter bound type. In
/// the last case, that includes omitting the extends keyword. For a variable or
/// parameter, a var keyword may replace the type.
///
/// @description Check that it is no error if an augmenting declaration
/// specifies the same formal parameter type as the augmented declaration does.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'type_inheritance_A04_t03.dart';

augment void topLevelFunction(dynamic v) {
  _log = "Augmented $v";
}
augment void topLevelSetter(final dynamic v) {
  _log = "Augmented $v";
}

augment class C {
  augment static void staticMethod(final dynamic v) {
    _log = "Augmented $v";
  }
  augment static void set staticSetter(dynamic v) {
    _log = "Augmented $v";
  }
  augment void instanceMethod(dynamic v) {
    _log = "Augmented $v";
  }
  augment void set instanceSetter(final dynamic v) {
    _log = "Augmented $v";
  }
}

augment mixin M {
  augment static void staticMethod(dynamic v) {
    _log = "Augmented $v";
  }
  augment static void set staticSetter(final dynamic v) {
    _log = "Augmented $v";
  }
  augment void instanceMethod(final dynamic v) {
    _log = "Augmented $v";
  }
  augment void set instanceSetter(dynamic v) {
    _log = "Augmented $v";
  }
}

augment enum E {
  augment e0;
  augment static void staticMethod(final dynamic v) {
    _log = "Augmented $v";
  }
  augment static void set staticSetter(dynamic v) {
    _log = "Augmented $v";
  }
  augment void instanceMethod(dynamic v) {
    _log = "Augmented $v";
  }
  augment void set instanceSetter(final dynamic v) {
    _log = "Augmented $v";
  }
}

augment extension Ext {
  augment static void staticMethod(dynamic v) {
    _log = "Augmented $v";
  }
  augment static void set staticSetter(final dynamic v) {
    _log = "Augmented $v";
  }
  augment void instanceMethod(final dynamic v) {
    _log = "Augmented $v";
  }
  augment void set instanceSetter(dynamic v) {
    _log = "Augmented $v";
  }
}

augment extension type ET(int id) {
  augment static void staticMethod(final dynamic v) {
    _log = "Augmented $v";
  }
  augment static void set staticSetter(dynamic v) {
    _log = "Augmented $v";
  }
  augment void instanceMethod(dynamic v) {
    _log = "Augmented $v";
  }
  augment void set instanceSetter(final dynamic v) {
    _log = "Augmented $v";
  }
}

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

augment library 'type_inheritance_A01_t03.dart';
import '../../Utils/static_type_helper.dart';

augment void topLevelFunction(var v) {
  v.expectStaticType<Exactly<String>>();
  _log = "Augmented $v";
}
augment void topLevelSetter(final v) {
  v.expectStaticType<Exactly<String>>();
  _log = "Augmented $v";
}

augment class C {
  augment static void staticMethod(final v) {
    v.expectStaticType<Exactly<String>>();
    _log = "Augmented $v";
  }
  augment static void set staticSetter(var v) {
    v.expectStaticType<Exactly<String>>();
    _log = "Augmented $v";
  }
  augment void instanceMethod(var v) {
    v.expectStaticType<Exactly<String>>();
    _log = "Augmented $v";
  }
  augment void set instanceSetter(final v) {
    v.expectStaticType<Exactly<String>>();
    _log = "Augmented $v";
  }
}

augment mixin M {
  augment static void staticMethod(var v) {
    v.expectStaticType<Exactly<String>>();
    _log = "Augmented $v";
  }
  augment static void set staticSetter(final v) {
    v.expectStaticType<Exactly<String>>();
    _log = "Augmented $v";
  }
  augment void instanceMethod(final v) {
    v.expectStaticType<Exactly<String>>();
    _log = "Augmented $v";
  }
  augment void set instanceSetter(var v) {
    v.expectStaticType<Exactly<String>>();
    _log = "Augmented $v";
  }
}

augment enum E {
  augment e0;
  augment static void staticMethod(final v) {
    v.expectStaticType<Exactly<String>>();
    _log = "Augmented $v";
  }
  augment static void set staticSetter(var v) {
    v.expectStaticType<Exactly<String>>();
    _log = "Augmented $v";
  }
  augment void instanceMethod(var v) {
    v.expectStaticType<Exactly<String>>();
    _log = "Augmented $v";
  }
  augment void set instanceSetter(final v) {
    v.expectStaticType<Exactly<String>>();
    _log = "Augmented $v";
  }
}

augment extension Ext {
  augment static void staticMethod(var v) {
    v.expectStaticType<Exactly<String>>();
    _log = "Augmented $v";
  }
  augment static void set staticSetter(final v) {
    v.expectStaticType<Exactly<String>>();
    _log = "Augmented $v";
  }
  augment void instanceMethod(final v) {
    v.expectStaticType<Exactly<String>>();
    _log = "Augmented $v";
  }
  augment void set instanceSetter(var v) {
    v.expectStaticType<Exactly<String>>();
    _log = "Augmented $v";
  }
}

augment extension type ET(int id) {
  augment static void staticMethod(final v) {
    v.expectStaticType<Exactly<String>>();
    _log = "Augmented $v";
  }
  augment static void set staticSetter(var v) {
    v.expectStaticType<Exactly<String>>();
    _log = "Augmented $v";
  }
  augment void instanceMethod(var v) {
    v.expectStaticType<Exactly<String>>();
    _log = "Augmented $v";
  }
  augment void set instanceSetter(final v) {
    v.expectStaticType<Exactly<String>>();
    _log = "Augmented $v";
  }
}

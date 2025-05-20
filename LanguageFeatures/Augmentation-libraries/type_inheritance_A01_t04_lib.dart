// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An augmenting declaration may have no type annotations for a
/// return type, variable type, parameter type, or type parameter bound type. In
/// the last case, that includes omitting the `extends` keyword. For a variable
/// or parameter, a `var` keyword may replace the type.
///
/// @description Check that augmenting declaration may have no type annotations
/// for a formal parameter type.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,enhanced-parts

part of 'type_inheritance_A01_t04.dart';
import '../../Utils/static_type_helper.dart';

augment void topLevelFunction1({var v}) {
  v.expectStaticType<Exactly<String>>();
  _log = "Augmented $v";
}

augment void topLevelFunction2({required var v});

augment void topLevelFunction3([var v]) {
  v.expectStaticType<Exactly<String>>();
  _log = "Augmented $v";
}

augment class C {
  augment static void staticMethod([final v]) {
    v.expectStaticType<Exactly<String>>();
    _log = "Augmented $v";
  }
  augment void instanceMethod({required var v});
}

augment mixin M {
  augment static void staticMethod([var v]) {
    v.expectStaticType<Exactly<String>>();
    _log = "Augmented $v";
  }
  augment void instanceMethod({final v});
}

augment enum E {
  augment static void staticMethod({final v});

  augment void instanceMethod([var v]){
    v.expectStaticType<Exactly<String>>();
    _log = "Augmented $v";
  }
}

augment extension Ext {
  augment static void staticMethod([var v]) {
    v.expectStaticType<Exactly<String>>();
    _log = "Augmented $v";
  }
  augment void instanceMethod({required final v});
}

augment extension type ET {
  augment static void staticMethod({required final v}) {
    v.expectStaticType<Exactly<String>>();
    _log = "Augmented $v";
  }
  augment void instanceMethod([var v = ""]);
}

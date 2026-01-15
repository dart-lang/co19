// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An augmenting declaration may omit type annotations for a return
/// type, variable type, parameter type, or type parameter bound. In the last
/// case, that includes omitting the `extends` keyword. For a variable, a `var`
/// keyword replaces the type if the variable isn't `final`.
///
/// If a type annotation or type parameter bound is omitted in the augmenting
/// declaration, it is inferred to be the same as the corresponding type
/// annotation or type parameter bound in the declaration being augmented.
///
/// @description Check that augmenting declaration may have no type annotations
/// for a formal parameter type. Test setters.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/static_type_helper.dart';

void set topLevelSetter(String v);

augment void set topLevelSetter(v) {
  v.expectStaticType<Exactly<String>>();
}

class C {
  static void set staticSetter(String v);
  void set instanceSetter(String v);
}

augment class C {
  augment static void set staticSetter(v) {
    v.expectStaticType<Exactly<String>>();
  }
  augment void set instanceSetter(v) {
    v.expectStaticType<Exactly<String>>();
  }
}

mixin M {
  static void set staticSetter(String v);
  void set instanceSetter(String v);
}

augment mixin M {
  augment static void set staticSetter(v) {
    v.expectStaticType<Exactly<String>>();
  }
  augment void set instanceSetter(v) {
    v.expectStaticType<Exactly<String>>();
  }
}

enum E {
  e0;
  static void set staticSetter(String v);
  void set instanceSetter(String v);
}

augment enum E {
  ;
  augment static void set staticSetter(v) {
    v.expectStaticType<Exactly<String>>();
  }
  augment void set instanceSetter(v) {
    v.expectStaticType<Exactly<String>>();
  }
}

class A {}

extension Ext on A {
  static void set staticSetter(String v);
  void set instanceSetter(String v);
}

augment extension Ext {
  augment static void set staticSetter(v) {
    v.expectStaticType<Exactly<String>>();
  }
  augment void set instanceSetter(v) {
    v.expectStaticType<Exactly<String>>();
  }
}

extension type ET(int id) {
  static void set staticSetter(String v);
  void set instanceSetter(String v);
}

augment extension type ET {
  augment static void set staticSetter(v) {
    v.expectStaticType<Exactly<String>>();
  }
  augment void set instanceSetter(v) {
    v.expectStaticType<Exactly<String>>();
  }
}

class MA = Object with M;

main() {
  topLevelSetter = "x";
  C.staticSetter = "x";
  C().instanceSetter = "x";
  M.staticSetter = "x";
  MA().instanceSetter = "x";
  E.staticSetter = "x";
  E.e0.instanceSetter = "x";
  Ext.staticSetter = "x";
  A().instanceSetter = "x";
  ET.staticSetter = "x";
  ET(0).instanceSetter = "x";
}

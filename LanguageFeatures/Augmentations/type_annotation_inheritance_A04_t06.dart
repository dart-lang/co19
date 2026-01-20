// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If the type annotation or type parameter bound is not omitted,
/// then it's a compile-time error if the type denoted by the augmenting
/// declaration is not the same type as the type in the corresponding
/// declaration being augmented.
///
/// @description Check that it is no error if an augmenting declaration
/// specifies the same formal parameter type as the introductory declaration
/// does.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

typedef StringAlias = String;

void topLevelFunction(String v) {}
augment topLevelFunction(StringAlias v);

void set topLevelSetter(StringAlias v);
augment void set topLevelSetter(String v) {}

class C {
  static void staticMethod(String v) {}
  static void set staticSetter(StringAlias v);

  void instanceMethod(StringAlias v);
  void set instanceSetter(String v) {}
}

augment class C {
  augment static void staticMethod(StringAlias v);
  augment static void set staticSetter(String v) {}

  augment void instanceMethod(String v) {}
  augment void set instanceSetter(StringAlias v);
}

mixin M {
  static void staticMethod(String v) {}
  static void set staticSetter(StringAlias v);

  void instanceMethod(StringAlias v);
  void set instanceSetter(String v) {}
}

augment mixin M {
  augment static void staticMethod(StringAlias v);
  augment static void set staticSetter(String v) {}

  augment void instanceMethod(String v) {}
  augment void set instanceSetter(StringAlias v);
}

enum E {
  e0;
  static void staticMethod(String v) {}
  static void set staticSetter(StringAlias v);

  void instanceMethod(StringAlias v);
  void set instanceSetter(String v) {}
}

augment enum E {
  ;
  augment static void staticMethod(StringAlias v);
  augment static void set staticSetter(String v) {}

  augment void instanceMethod(String v) {}
  augment void set instanceSetter(StringAlias v);
}

class A {}

extension Ext on A {
  static void staticMethod(String v) {}
  static void set staticSetter(StringAlias v);

  void instanceMethod(StringAlias v);
  void set instanceSetter(String v) {}
}

augment extension Ext {
  augment static void staticMethod(StringAlias v);
  augment static void set staticSetter(String v) {}

  augment void instanceMethod(String v) {}
  augment void set instanceSetter(StringAlias v);
}

extension type ET(int id) {
  static void staticMethod(String v) {}
  static void set staticSetter(StringAlias v);

  void instanceMethod(StringAlias v);
  void set instanceSetter(String v) {}
}

augment extension type ET {
  augment static void staticMethod(StringAlias v);
  augment static void set staticSetter(String v) {}

  augment void instanceMethod(String v) {}
  augment void set instanceSetter(StringAlias v);
}

class MA = Object with M;

main() {
  topLevelFunction("x");
  topLevelSetter = "x";
  C.staticMethod("x");
  C.staticSetter = "x";
  C().instanceMethod("x");
  C().instanceSetter = "x";
  M.staticMethod("x");
  M.staticSetter = "x";
  MA().instanceMethod("x");
  MA().instanceSetter = "x";
  E.staticMethod("x");
  E.staticSetter = "x";
  E.e0.instanceMethod("x");
  E.e0.instanceSetter = "x";
  Ext.staticMethod("x");
  Ext.staticSetter = "x";
  A().instanceMethod("x");
  A().instanceSetter = "x";
  ET.staticMethod("x");
  ET.staticSetter = "x";
  ET(0).instanceMethod("x");
  ET(0).instanceSetter = "x";
}

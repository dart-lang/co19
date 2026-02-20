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
/// @description Checks that it is not an error if an augmentation omits the
/// return type of an augmenting getter.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

int get topLevelGetter1 => 0;
Object? get topLevelGetter2 => 0;
Null get topLevelGetter3 => null;
dynamic get topLevelGetter4 => "";
Never get topLevelGetter5 => throw Exception();

augment get topLevelGetter1;
augment get topLevelGetter2;
augment get topLevelGetter3;
augment get topLevelGetter4;
augment get topLevelGetter5;

class C {
  static int get staticGetter1 => 0;
  static Object? get staticGetter2 => 0;
  static Null get staticGetter3 => null;
  static dynamic get staticGetter4 => "";
  static Never get staticGetter5 => throw Exception();

  int get instanceGetter1 => 0;
  Object? get instanceGetter2 => 0;
  Null get instanceGetter3 => null;
  dynamic get instanceGetter4 => "";
  Never get instanceGetter5 => throw Exception();
}

augment class C {
  augment static get staticGetter1;
  augment static get staticGetter2;
  augment static get staticGetter3;
  augment static get staticGetter4;
  augment static get staticGetter5;

  augment get instanceGetter1;
  augment get instanceGetter2;
  augment get instanceGetter3;
  augment get instanceGetter4;
  augment get instanceGetter5;
}

mixin M {
  static int get staticGetter1 => 0;
  static Object? get staticGetter2 => 0;
  static Null get staticGetter3 => null;
  static dynamic get staticGetter4 => "";
  static Never get staticGetter5 => throw Exception();

  int get instanceGetter1 => 0;
  Object? get instanceGetter2 => 0;
  Null get instanceGetter3 => null;
  dynamic get instanceGetter4 => "";
  Never get instanceGetter5 => throw Exception();
}

augment mixin M {
  augment static get staticGetter1;
  augment static get staticGetter2;
  augment static get staticGetter3;
  augment static get staticGetter4;
  augment static get staticGetter5;

  augment get instanceGetter1;
  augment get instanceGetter2;
  augment get instanceGetter3;
  augment get instanceGetter4;
  augment get instanceGetter5;
}

enum E {
  e1;
  static int get staticGetter1 => 0;
  static Object? get staticGetter2 => 0;
  static Null get staticGetter3 => null;
  static dynamic get staticGetter4 => "";
  static Never get staticGetter5 => throw Exception();

  int get instanceGetter1 => 0;
  Object? get instanceGetter2 => 0;
  Null get instanceGetter3 => null;
  dynamic get instanceGetter4 => "";
  Never get instanceGetter5 => throw Exception();
}

augment enum E {
  ;
  augment static get staticGetter1;
  augment static get staticGetter2;
  augment static get staticGetter3;
  augment static get staticGetter4;
  augment static get staticGetter5;

  augment get instanceGetter1;
  augment get instanceGetter2;
  augment get instanceGetter3;
  augment get instanceGetter4;
  augment get instanceGetter5;
}

class A {}

extension Ext on A {
  static int get staticGetter1 => 0;
  static Object? get staticGetter2 => 0;
  static Null get staticGetter3 => null;
  static dynamic get staticGetter4 => "";
  static Never get staticGetter5 => throw Exception();

  int get instanceGetter1 => 0;
  Object? get instanceGetter2 => 0;
  Null get instanceGetter3 => null;
  dynamic get instanceGetter4 => "";
  Never get instanceGetter5 => throw Exception();
}

augment extension Ext {
  augment static get staticGetter1;
  augment static get staticGetter2;
  augment static get staticGetter3;
  augment static get staticGetter4;
  augment static get staticGetter5;

  augment get instanceGetter1;
  augment get instanceGetter2;
  augment get instanceGetter3;
  augment get instanceGetter4;
  augment get instanceGetter5;
}

extension type ET(int _) {
  static int get staticGetter1 => 0;
  static Object? get staticGetter2 => 0;
  static Null get staticGetter3 => null;
  static dynamic get staticGetter4 => "";
  static Never get staticGetter5 => throw Exception();

  int get instanceGetter1 => 0;
  Object? get instanceGetter2 => 0;
  Null get instanceGetter3 => null;
  dynamic get instanceGetter4 => "";
  Never get instanceGetter5 => throw Exception();
}

augment extension type ET {
  augment static get staticGetter1;
  augment static get staticGetter2;
  augment static get staticGetter3;
  augment static get staticGetter4;
  augment static get staticGetter5;

  augment get instanceGetter1;
  augment get instanceGetter2;
  augment get instanceGetter3;
  augment get instanceGetter4;
  augment get instanceGetter5;
}

class MA = Object with M;

main() {
  int i = topLevelGetter1;
  Object? o = topLevelGetter2;
  Null n = topLevelGetter3;
  if (1 > 2) {
    topLevelGetter4.testDynamic;
    Never n = topLevelGetter5;
  }

  i = C.staticGetter1;
  o = C.staticGetter2;
  n = C.staticGetter3;
  if (1 > 2) {
    C.staticGetter4.testDynamic;
    Never n = C.staticGetter5;
  }
  i = C().instanceGetter1;
  o = C().instanceGetter2;
  n = C().instanceGetter3;
  if (1 > 2) {
    C().instanceGetter4.testDynamic;
    Never n = C().instanceGetter5;
  }

  i = M.staticGetter1;
  o = M.staticGetter2;
  n = M.staticGetter3;
  if (1 > 2) {
    M.staticGetter4.testDynamic;
    Never n = M.staticGetter5;
  }
  i = MA().instanceGetter1;
  o = MA().instanceGetter2;
  n = MA().instanceGetter3;
  if (1 > 2) {
    MA().instanceGetter4.testDynamic;
    Never n = MA().instanceGetter5;
  }

  i = E.staticGetter1;
  o = E.staticGetter2;
  n = E.staticGetter3;
  if (1 > 2) {
    E.staticGetter4.testDynamic;
    Never n = E.staticGetter5;
  }
  i = E.e1.instanceGetter1;
  o = E.e1.instanceGetter2;
  n = E.e1.instanceGetter3;
  if (1 > 2) {
    E.e1.instanceGetter4.testDynamic;
    Never n = E.e1.instanceGetter5;
  }

  i = Ext.staticGetter1;
  o = Ext.staticGetter2;
  n = Ext.staticGetter3;
  if (1 > 2) {
    Ext.staticGetter4.testDynamic;
    Never n = Ext.staticGetter5;
  }
  i = A().instanceGetter1;
  o = A().instanceGetter2;
  n = A().instanceGetter3;
  if (1 > 2) {
    A().instanceGetter4.testDynamic;
    Never n = A().instanceGetter5;
  }

  i = ET.staticGetter1;
  o = ET.staticGetter2;
  n = ET.staticGetter3;
  if (1 > 2) {
    ET.staticGetter4.testDynamic;
    Never n = ET.staticGetter5;
  }
  i = ET(0).instanceGetter1;
  o = ET(0).instanceGetter2;
  n = ET(0).instanceGetter3;
  if (1 > 2) {
    ET(0).instanceGetter4.testDynamic;
    Never n = ET(0).instanceGetter5;
  }
}

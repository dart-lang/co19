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
/// bounds the type parameters of an augmenting function.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/static_type_helper.dart';

void topLevelFunction<T extends num>() {}

augment void topLevelFunction<T>();

class C {
  static void staticMethod<T extends num>() {}
  void instanceMethod<T extends num>() {}
}

augment class C {
  augment static void staticMethod<T>();
  augment void instanceMethod<T>();
}

mixin M {
  static void staticMethod<T extends num>() {}
  void instanceMethod<T extends num>() {}
}

augment mixin M {
  augment static void staticMethod<T>();
  augment void instanceMethod<T>();
}

enum E {
  e1;
  static void staticMethod<T extends num>() {}
  void instanceMethod<T extends num>() {}
}

augment enum E {
  ;
  augment static void staticMethod<T>();
  augment void instanceMethod<T>();
}

class A {}

extension Ext on A {
  static void staticMethod<T extends num>() {}
  void instanceMethod<T extends num>() {}
}

augment extension Ext {
  augment static void staticMethod<T>();
  augment void instanceMethod<T>();
}

extension type ET(int _) {
  static void staticMethod<T extends num>() {}
  void instanceMethod<T extends num>() {}
}

augment extension type ET {
  augment static void staticMethod<T>();
  augment void instanceMethod<T>();
}

class MA = Object with M;

main() {
  topLevelFunction.expectStaticType<Exactly<void Function<T extends num>()>>();

  C.staticMethod.expectStaticType<Exactly<void Function<T extends num>()>>();
  C().instanceMethod.expectStaticType<Exactly<void Function<T extends num>()>>();

  M.staticMethod.expectStaticType<Exactly<void Function<T extends num>()>>();
  MA().instanceMethod.expectStaticType<Exactly<void Function<T extends num>()>>();

  E.staticMethod.expectStaticType<Exactly<void Function<T extends num>()>>();
  E.e1.instanceMethod.expectStaticType<Exactly<void Function<T extends num>()>>();

  Ext.staticMethod.expectStaticType<Exactly<void Function<T extends num>()>>();
  A().instanceMethod.expectStaticType<Exactly<void Function<T extends num>()>>();

  ET.staticMethod.expectStaticType<Exactly<void Function<T extends num>()>>();
  ET(0).instanceMethod.expectStaticType<Exactly<void Function<T extends num>()>>();
}

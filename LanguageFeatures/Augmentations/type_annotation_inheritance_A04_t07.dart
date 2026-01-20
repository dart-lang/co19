// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If the type annotation or type parameter bound is omitted in the
/// augmenting declaration, it is inferred to be the same as the corresponding
/// type annotation or type parameter bound in the declaration being augmented.
///
/// If the type annotation or type parameter bound is not omitted, then it's a
/// compile-time error if the type denoted by the augmenting declaration is not
/// the same type as the type in the corresponding declaration being augmented.
///
/// @description Check that it is no error if an augmenting declaration
/// specifies the same type bound as the introductory declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/static_type_helper.dart';

typedef NumAlias = num;

void topLevelFunction<T extends num>(T v) {}
augment void topLevelFunction<T extends NumAlias>(T v);

class C {
  static void staticMethod<X extends num>(X _);
  void instanceMethod<X extends num>(X _) {}
}

augment class C {
  augment static void staticMethod<X extends NumAlias>(X _) {}
  augment void instanceMethod<X extends NumAlias>(X _);
}

mixin M {
  static void staticMethod<X extends num>(X _);
  void instanceMethod<X extends num>(X _) {}
}

augment mixin M {
  augment static void staticMethod<X extends NumAlias>(X _) {}
  augment void instanceMethod<X extends NumAlias>(X _);
}

enum E {
  e0;
  static void staticMethod<X extends num>(X _);
  void instanceMethod<X extends num>(X _) {}
}

augment enum E {
  ;
  augment static void staticMethod<X extends NumAlias>(X _) {}
  augment void instanceMethod<X extends NumAlias>(X _);
}

class A {}

extension Ext on A {
  static void staticMethod<X extends num>(X _);
  void instanceMethod<X extends num>(X _) {}
}

augment extension Ext {
  augment static void staticMethod<X extends NumAlias>(X _) {}
  augment void instanceMethod<X extends NumAlias>(X _);
}

extension type ET(int id) {
  static void staticMethod<X extends num>(X _);
  void instanceMethod<X extends num>(X _) {}
}

augment extension type ET {
  augment static void staticMethod<X extends NumAlias>(X _) {}
  augment void instanceMethod<X extends NumAlias>(X _);
}

class MA = Object with M;

main() {
  topLevelFunction.expectStaticType<Exactly<void Function<T extends num>(T)>>();
  C.staticMethod.expectStaticType<Exactly<void Function<T extends num>(T)>>();
  C().instanceMethod
      .expectStaticType<Exactly<void Function<T extends num>(T)>>();
  M.staticMethod.expectStaticType<Exactly<void Function<T extends num>(T)>>();
  MA().instanceMethod
      .expectStaticType<Exactly<void Function<T extends num>(T)>>();
  E.staticMethod.expectStaticType<Exactly<void Function<T extends num>(T)>>();
  E.e0.instanceMethod
      .expectStaticType<Exactly<void Function<T extends num>(T)>>();
  Ext.staticMethod.expectStaticType<Exactly<void Function<T extends num>(T)>>();
  A().instanceMethod
      .expectStaticType<Exactly<void Function<T extends num>(T)>>();
  ET.staticMethod.expectStaticType<Exactly<void Function<T extends num>(T)>>();
  ET(0).instanceMethod
      .expectStaticType<Exactly<void Function<T extends num>(T)>>();
}

// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
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
/// specifies the same formal parameter type as the introductory declaration
/// does.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,enhanced-parts

part of 'type_inheritance_A04_t03.dart';

augment void topLevelFunction(dynamic v);

augment void set topLevelSetter(final dynamic v);

augment class C {
  augment static void staticMethod(final dynamic v);
  augment static void set staticSetter(dynamic v);
  augment void instanceMethod(dynamic v);
  augment void set instanceSetter(final dynamic v);
}

augment mixin M {
  augment static void staticMethod(final dynamic v);
  augment static void set staticSetter(dynamic v);
  augment void instanceMethod(dynamic v);
  augment void set instanceSetter(final dynamic v);
}

augment enum E {
  e1;
  augment static void staticMethod(final dynamic v);
  augment static void set staticSetter(dynamic v);
  augment void instanceMethod(dynamic v);
  augment void set instanceSetter(final dynamic v);
}

augment extension Ext {
  augment static void staticMethod(final dynamic v);
  augment static void set staticSetter(dynamic v);
  augment void instanceMethod(dynamic v);
  augment void set instanceSetter(final dynamic v);
}

augment extension type ET {
  augment static void staticMethod(final dynamic v);
  augment static void set staticSetter(dynamic v);
  augment void instanceMethod(dynamic v);
  augment void set instanceSetter(final dynamic v);
}

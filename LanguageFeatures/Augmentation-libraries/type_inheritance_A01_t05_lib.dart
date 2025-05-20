// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An augmenting declaration may have no type annotations for a
/// return type, variable type, parameter type, or type parameter bound type. In
/// the last case, that includes omitting the `extends` keyword. For a variable
/// or parameter, a `var` keyword may replace the type.
///
/// @description Check that augmenting declaration may omit type parameter bound
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,enhanced-parts

part of 'type_inheritance_A01_t05.dart';

augment void topLevelFunction<T>(T v);

augment class C<T> {
  augment static void staticMethod<X>(X _) {}
  augment void instanceMethod<X>(X _);
}

augment mixin M<T> {
  augment static void staticMethod<X>(X _);
  augment void instanceMethod<X>(X _) {}
}

augment enum E<T> {
  augment e0;
  augment static void staticMethod<X>(X _) {}
  augment void instanceMethod<X>(X _);
}

augment extension Ext<T> {
  augment static void staticMethod<X>(X _);
  augment void instanceMethod<X>(X _) {}
}

augment extension type ET<T> {
  augment static void staticMethod<X>(X _) {}
  augment void instanceMethod<X>(X _);
}

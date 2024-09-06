// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An augmenting declaration may have no type annotations for a
/// return type, variable type, parameter type, or type parameter bound type. In
/// the last case, that includes omitting the extends keyword. For a variable or
/// parameter, a var keyword may replace the type.
///
/// When applying an augmenting declaration that contains a type annotation at
/// one of these positions, to a definition to be augmented, it's a compile-time
/// error if the type denoted by the augmenting declaration is not the same type
/// as the type that the augmented definition has at the corresponding position.
/// An augmenting declaration can omit type annotations, but if it doesn't, it
/// must repeat the type from the augmented definition.
///
/// @description Check that it is no error if an augmenting declaration
/// specifies the same type bound as the augmented declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'type_inheritance_A05_t02.dart';

augment void topLevelFunction<T extends NumAlias>(T v) {}

augment class C<T extends NumAlias> {
  augment static void staticMethod<X extends NumAlias>(X _) {}
  augment void instanceMethod<X extends NumAlias>(X _) {}
}

augment mixin M<T extends NumAlias> {
  augment static void staticMethod<X extends NumAlias>(X _) {}
  augment void instanceMethod<X extends NumAlias>(X _) {}
}

augment enum E<T extends NumAlias> {
  augment e0;
  augment static void staticMethod<X extends NumAlias>(X _) {}
  augment void instanceMethod<X extends NumAlias>(X _) {}
}

augment extension Ext<T extends NumAlias> {
  augment static void staticMethod<X extends NumAlias>(X _) {}
  augment void instanceMethod<X extends NumAlias>(X _) {}
}

augment extension type ET<T extends NumAlias> {
  augment static void staticMethod<X extends NumAlias>(X _) {}
  augment void instanceMethod<X extends NumAlias>(X _) {}
}

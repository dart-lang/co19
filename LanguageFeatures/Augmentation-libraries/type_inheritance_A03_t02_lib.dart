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
/// @description Check that it is not an error if augmenting declaration
/// specifies the same variable type as the augmented declaration does.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'type_inheritance_A03_t02.dart';

augment NumAlias topLevelVariable = 1;
augment final NumAlias finalTopLevelVariable = 2;

augment class C {
  augment static NumAlias staticVariable = 3;
  augment static final NumAlias finalStaticVariable = 4;
  augment NumAlias instanceVariable = 5;
  augment final NumAlias finalInstanceVariable = 6;
}

augment mixin M {
  augment static NumAlias staticVariable = 7;
  augment static final NumAlias finalStaticVariable = 8;
  augment NumAlias instanceVariable = 9;
  augment final NumAlias finalInstanceVariable = 10;
}

augment enum E {
  augment e0;
  augment static NumAlias staticVariable = 11;
  augment static final NumAlias finalStaticVariable = 12;
  augment final NumAlias finalInstanceVariable = 13;
}

augment extension Ext {
  augment static NumAlias staticVariable = 14;
  augment static final NumAlias finalStaticVariable = 15;
}

augment extension type ET(num id) {
  augment static NumAlias staticVariable = 16;
  augment static final NumAlias finalStaticVariable = 17;
  augment final NumAlias id = 18;
}

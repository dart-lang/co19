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
/// @description Check that it is no error if augmenting declaration specifies
/// the same return type as the augmented declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'type_inheritance_A02_t02.dart';

augment dynamic get topLevelGetter => 1;
augment dynamic topLevelFunction() => 2;

augment class C {
  augment static dynamic get staticGetter => 3;
  augment static dynamic staticMethod() => 4;
  augment dynamic get instanceGetter => 5;
  augment dynamic instanceMethod() => 6;
}

augment mixin M {
  augment static dynamic get staticGetter => 7;
  augment static dynamic staticMethod() => 8;
  augment dynamic get instanceGetter => 9;
  augment dynamic instanceMethod() => 10;
}

augment enum E {
  augment e0;
  augment static dynamic get staticGetter => 11;
  augment static dynamic staticMethod() => 12;
  augment dynamic get instanceGetter => 13;
  augment dynamic instanceMethod() => 14;
}

augment extension Ext {
  augment static dynamic get staticGetter => 15;
  augment static dynamic staticMethod() => 16;
  augment dynamic get instanceGetter => 17;
  augment dynamic instanceMethod() => 18;
}

augment extension type ET {
  augment static dynamic get staticGetter => 19;
  augment static dynamic staticMethod() => 20;
  augment dynamic get instanceGetter => 21;
  augment dynamic instanceMethod() => 22;
}

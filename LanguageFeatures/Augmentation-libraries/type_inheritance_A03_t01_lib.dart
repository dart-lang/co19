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
/// @description Check that it is a compile-time error if augmenting declaration
/// specifies a different variable type than the augmented declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'type_inheritance_A03_t01.dart';

augment int topLevelVariable = 0;
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified
augment final Object finalTopLevelVariable = 0;
//            ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment class C {
  augment static int staticVariable = 0;
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static final Object finalStaticVariable = 0;
//                     ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment Object instanceVariable = 0;
//        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment final int finalInstanceVariable = 0;
//              ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment mixin M {
  augment static int staticVariable = 0;
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static final Object finalStaticVariable = 0;
//                     ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment Object instanceVariable = 0;
//        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment final int finalInstanceVariable = 0;
//              ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment enum E {
  augment e0;
  augment static int staticVariable = 0;
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static final Object finalStaticVariable = 0;
//                     ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment final int finalInstanceVariable = 0;
//              ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension Ext {
  augment static int staticVariable = 0;
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static final Object finalStaticVariable = 0;
//                     ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension type ET {
  augment static int staticVariable = 0;
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static final Object finalStaticVariable = 0;
//                     ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment final int id = 0;
//              ^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment final Object id = 0;
//              ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

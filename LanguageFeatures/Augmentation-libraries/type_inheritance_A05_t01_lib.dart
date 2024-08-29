// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An augmenting declaration may have no type annotations for a
/// return type, variable type, parameter type, or type parameter bound type. In
/// the last case, that includes omitting the extends keyword. For a variable or
/// parameter, a var keyword may replace the type.
///
/// @description Check that it is a compile-time error if augmenting declaration
/// specifies a type parameter bound other than the augmented declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'type_inheritance_A01_t05.dart';

augment void topLevelFunction1<T extends int>(T v) {}
//                                       ^^^
// [analyzer] unspecified
// [cfe] unspecified
augment void topLevelFunction2<T extends Object>(T v) {}
//                                       ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment class C<T extends int> {
//                        ^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod<X extends Object>(X _) {}
//                                           ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod<X extends int>(X _) {}
//                                      ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment mixin M<T extends Object> {
//                        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod<X extends int>(X _) {}
//                                           ^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod<X extends Object>(X _) {}
//                                      ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment enum E<T extends int> {
//                       ^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment e0;
  augment static void staticMethod<X extends Object>(X _) {}
//                                           ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod<X extends int>(X _) {}
//                                      ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension Ext<T extends Object> {
//                              ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod<X extends int>(X _) {}
//                                           ^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod<X extends Object>(X _) {}
//                                      ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension type ET<T extends int> {
//                                  ^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod<X extends Object>(X _) {}
//                                           ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod<X extends int>(X _) {}
//                                      ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

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
/// @description Check that it is a compile-time error if augmenting declaration
/// specifies a type parameter bound other than the introductory declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,enhanced-parts

part of 'type_inheritance_A01_t05.dart';

augment void topLevelFunction1<T extends int>(T v);
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
  augment void instanceMethod<X extends int>(X _);
//                                      ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment mixin M<T extends Object> {
//                        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod<X extends int>(X _);
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
  e1;
  augment static void staticMethod<X extends Object>(X _) {}
//                                           ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod<X extends int>(X _);
//                                      ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension Ext<T extends Object> {
//                              ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod<X extends int>(X _);
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
  augment void instanceMethod<X extends int>(X _);
//                                      ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

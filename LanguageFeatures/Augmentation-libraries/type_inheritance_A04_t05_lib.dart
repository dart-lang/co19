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
/// @description Check that it is a compile-time error if an augmenting
/// declaration specifies a formal parameter type other than the introductory
/// declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,enhanced-parts

part of 'type_inheritance_A04_t05.dart';

augment void topLevelFunction(Object? v) {}
//                            ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
augment void set topLevelSetter(Object? v);
//                              ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment class C {
  augment static void staticMethod(Object? v) {}
//                                 ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void set staticSetter(Object? v);
//                              ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod(final Object? v);
//                                  ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void set instanceSetter(Object? v) {}
//                                ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment mixin M {
  augment static void staticMethod(Object? v) {}
//                                 ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void set staticSetter(Object? v);
//                              ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod(final Object? v);
//                                  ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void set instanceSetter(Object? v) {}
//                                ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment enum E {
  e1;
  augment static void staticMethod(Object? v) {}
//                                 ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void set staticSetter(Object? v);
//                              ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod(final Object? v);
//                                  ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void set instanceSetter(Object? v) {}
//                                ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension Ext {
  augment static void staticMethod(Object? v) {}
//                                 ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void set staticSetter(Object? v);
//                              ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod(final Object? v);
//                                  ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void set instanceSetter(Object? v) {}
//                                ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension type ET {
  augment static void staticMethod(Object? v) {}
//                                 ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void set staticSetter(Object? v);
//                              ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod(final Object? v);
//                                  ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void set instanceSetter(Object? v) {}
//                                ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

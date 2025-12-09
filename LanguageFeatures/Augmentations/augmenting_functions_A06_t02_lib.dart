// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if:
/// ...
/// - More than one declaration in the augmentation chain specifies a default
///   value for the same optional parameter. This is an error even in the case
///   where all of them are identical.
///
/// @description Checks that it is a compile-time error if more than one
/// declaration in the augmentation chain specifies a default value for the same
/// optional parameter.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,enhanced-parts

part of 'augmenting_functions_A06_t02.dart';

augment void topLevelFunction1([int v = 0]);
//                                    ^
// [analyzer] unspecified
// [cfe] unspecified

augment void topLevelFunction2({int v = 0});
//                                    ^
// [analyzer] unspecified
// [cfe] unspecified

augment class C {
  static void staticMethod1([int v = 0]);
//                                 ^
// [analyzer] unspecified
// [cfe] unspecified
  static void staticMethod2({int v = 0});
//                                 ^
// [analyzer] unspecified
// [cfe] unspecified
  void instanceMethod1([int v = 0]);
//                            ^
// [analyzer] unspecified
// [cfe] unspecified
  void instanceMethod2({int v = 0});
//                            ^
// [analyzer] unspecified
// [cfe] unspecified
}

augment mixin M {
  static void staticMethod1([int v = 0]);
//                                 ^
// [analyzer] unspecified
// [cfe] unspecified
  static void staticMethod2({int v = 0});
//                                 ^
// [analyzer] unspecified
// [cfe] unspecified
  void instanceMethod1([int v = 0]);
//                            ^
// [analyzer] unspecified
// [cfe] unspecified
  void instanceMethod2({int v = 0});
//                            ^
// [analyzer] unspecified
// [cfe] unspecified
}

augment enum E {
  ;
  static void staticMethod1([int v = 0]);
//                                 ^
// [analyzer] unspecified
// [cfe] unspecified
  static void staticMethod2({int v = 0});
//                                 ^
// [analyzer] unspecified
// [cfe] unspecified
  void instanceMethod1([int v = 0]);
//                            ^
// [analyzer] unspecified
// [cfe] unspecified
  void instanceMethod2({int v = 0});
//                            ^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension Ext {
  static void staticMethod1([int v = 0]);
//                                 ^
// [analyzer] unspecified
// [cfe] unspecified
  static void staticMethod2({int v = 0});
//                                 ^
// [analyzer] unspecified
// [cfe] unspecified
  void instanceMethod1([int v = 0]);
//                            ^
// [analyzer] unspecified
// [cfe] unspecified
  void instanceMethod2({int v = 0});
//                            ^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension type ET {
  static void staticMethod1([int v = 0]);
//                                 ^
// [analyzer] unspecified
// [cfe] unspecified
  static void staticMethod2({int v = 0});
//                                 ^
// [analyzer] unspecified
// [cfe] unspecified
  void instanceMethod1([int v = 0]);
//                            ^
// [analyzer] unspecified
// [cfe] unspecified
  void instanceMethod2({int v = 0});
//                            ^
// [analyzer] unspecified
// [cfe] unspecified
}

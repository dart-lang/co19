// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - The function augmentation specifies any default values.
///
/// @description Checks that it is a compile-time error if a function
/// augmentation specifies any default values.
/// @author sgrekhov22@gmail.com
/// @issue 55569

// SharedOptions=--enable-experiment=macros

augment library 'augmenting_functions_A05_t02.dart';

augment void topLevelFunction1([int? i = 1]) {}
//                                   ^
// [analyzer] unspecified
// [cfe] unspecified

augment void topLevelFunction2({int? i = 2}) {}
//                                   ^
// [analyzer] unspecified
// [cfe] unspecified

augment void topLevelFunction3({required int? i = 2}) {}
//                                            ^
// [analyzer] unspecified
// [cfe] unspecified

augment class C {
  augment static void staticMethod1([int? i = 2]) {}
//                                        ^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod2({int? i = 1}) {}
//                                        ^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod3({required int? i = 1}) {}
//                                                 ^
// [analyzer] unspecified
// [cfe] unspecified

  augment void instanceMethod1([int? i = 1]) {}
//                                   ^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod2([covariant int? i = 2]) {}
//                                             ^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod3({int? i = 2}) {}
//                                   ^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod4({covariant int? i = 1}) {}
//                                             ^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod5({required int? i = 1}) {}
//                                            ^
// [analyzer] unspecified
// [cfe] unspecified
}

augment mixin M {
  augment static void staticMethod1([int? i = 2]) {}
//                                        ^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod2({int? i = 1}) {}
//                                        ^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod3({required int? i = 1}) {}
//                                                 ^
// [analyzer] unspecified
// [cfe] unspecified

  augment void instanceMethod1([int? i = 1]) {}
//                                   ^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod2([covariant int? i = 2]) {}
//                                             ^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod3({int? i = 2}) {}
//                                   ^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod4({covariant int? i = 1}) {}
//                                             ^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod5({required int? i = 1}) {}
//                                            ^
// [analyzer] unspecified
// [cfe] unspecified
}

augment enum E {
  augment e1;

  augment static void staticMethod1([int? i = 2]) {}
//                                        ^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod2({int? i = 1}) {}
//                                        ^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod3({required int? i = 1}) {}
//                                                 ^
// [analyzer] unspecified
// [cfe] unspecified

  augment void instanceMethod1([int? i = 1]) {}
//                                   ^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod2([covariant int? i = 2]) {}
//                                             ^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod3({int? i = 2}) {}
//                                   ^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod4({covariant int? i = 1}) {}
//                                             ^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod5({required int? i = 1}) {}
//                                            ^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension Ext {
  augment static void staticMethod1([int? i = 2]) {}
//                                        ^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod2({int? i = 1}) {}
//                                        ^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod3({required int? i = 1}) {}
//                                                 ^
// [analyzer] unspecified
// [cfe] unspecified

  augment void instanceMethod1([int? i = 1]) {}
//                                   ^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod2({int? i = 2}) {}
//                                   ^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod3({required int? i = 2}) {}
//                                            ^
// [analyzer] unspecified
// [cfe] unspecified
}

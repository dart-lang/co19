// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// - The function signature of the augmenting function does not exactly match
///   the function signature of the augmented function. This means that any
///   provided return types must be the same type; there must be same number or
///   required and optional positional parameters, all with the same types (when
///   provided), the same number of named parameters, each pairwise with the
///   same name, same type (when provided) and same `required` and `covariant`
///   modifiers, and any type parameters and their bounds (when provided) must
///   be the same (like for type declarations).
///
/// @description Checks that it is a compile-time error if type of optional
/// parameters of an augmentation doesn't exactly match the original function.
/// @author sgrekhov22@gmail.com
/// @issue 55478

// SharedOptions=--enable-experiment=macros

augment library 'augmenting_functions_A04_t08.dart';

augment void topLevelFunction1([Object i]) {}
//           ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
augment void topLevelFunction2([int o]) {}
//           ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
augment void topLevelFunction3([String? s]) {}
//           ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
augment void topLevelFunction4<T extends String>([String? t]) {}
//           ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
augment void topLevelFunction5<T extends String>([T? t]) {}
//           ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment class C {
  augment static void staticMethod1([Object i]) {}
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod2([int o]) {}
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod3([String? s]) {}
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod4<T extends String>([String? t]) {}
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod5<T extends String>([T? t]) {}
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment void instanceMethod1([Object i]) {}
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod2([int o]) {}
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod3([String? s]) {}
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod4<T extends String>([String? t]) {}
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod5<T extends String>([T? t]) {}
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment mixin M {
  augment static void staticMethod1([Object i]) {}
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod2([int o]) {}
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod3([String? s]) {}
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod4<T extends String>([String? t]) {}
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod5<T extends String>([T? t]) {}
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment void instanceMethod1([Object i]) {}
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod2([int o]) {}
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod3([String? s]) {}
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod4<T extends String>([String? t]) {}
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod5<T extends String>([T? t]) {}
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment enum E {
  augment e1;

  augment static void staticMethod1([Object i]) {}
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod2([int o]) {}
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod3([String? s]) {}
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod4<T extends String>([String? t]) {}
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod5<T extends String>([T? t]) {}
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment void instanceMethod1([Object i]) {}
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod2([int o]) {}
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod3([String? s]) {}
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod4<T extends String>([String? t]) {}
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod5<T extends String>([T? t]) {}
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension Ext {
  augment static void staticMethod1([Object i]) {}
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod2([int o]) {}
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod3([String? s]) {}
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod4<T extends String>([String? t]) {}
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod5<T extends String>([T? t]) {}
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment void instanceMethod1([Object i]) {}
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod2([int o]) {}
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod3([String? s]) {}
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod4<T extends String>([String? t]) {}
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod5<T extends String>([T? t]) {}
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension type ET(int _) {
  augment static void staticMethod1([Object i]) {}
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod2([int o]) {}
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod3([String? s]) {}
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod4<T extends String>([String? t]) {}
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod5<T extends String>([T? t]) {}
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment void instanceMethod1([Object i]) {}
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod2([int o]) {}
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod3([String? s]) {}
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod4<T extends String>([String? t]) {}
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod5<T extends String>([T? t]) {}
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

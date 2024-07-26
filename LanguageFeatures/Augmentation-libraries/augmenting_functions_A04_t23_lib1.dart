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
/// @description Checks that it is a compile-time error if type of parameters of
/// an augmentation doesn't exactly match the original function. Test top types.
/// @author sgrekhov22@gmail.com
/// @issue 55478

// SharedOptions=--enable-experiment=macros

augment library 'augmenting_functions_A04_t23.dart';

augment void topLevelFunction1() => 1;
//           ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
augment Object? topLevelFunction2() => 1;
//              ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
augment dynamic topLevelFunction3() => 1;
//              ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment class C {
  augment static void staticMethod1() => 1;
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static Object? staticMethod2() => 1;
//                       ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static dynamic staticMethod3() => 1;
//                       ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment void instanceMethod1() => 1;
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment Object? instanceMethod2() => 1;
//                ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment dynamic instanceMethod3() => 1;
//                ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment mixin M {
  augment static void staticMethod1() => 1;
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static Object? staticMethod2() => 1;
//                       ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static dynamic staticMethod3() => 1;
//                       ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment void instanceMethod1() => 1;
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment Object? instanceMethod2() => 1;
//                ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment dynamic instanceMethod3() => 1;
//                ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment enum E {
  augment e1;

  augment static void staticMethod1() => 1;
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static Object? staticMethod2() => 1;
//                       ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static dynamic staticMethod3() => 1;
//                       ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment void instanceMethod1() => 1;
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment Object? instanceMethod2() => 1;
//                ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment dynamic instanceMethod3() => 1;
//                ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension Ext {
  augment static void staticMethod1() => 1;
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static Object? staticMethod2() => 1;
//                       ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static dynamic staticMethod3() => 1;
//                       ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment void instanceMethod1() => 1;
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment Object? instanceMethod2() => 1;
//                ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment dynamic instanceMethod3() => 1;
//                ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension type ET(int _) {
  augment static void staticMethod1() => 1;
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static Object? staticMethod2() => 1;
//                       ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static dynamic staticMethod3() => 1;
//                       ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment void instanceMethod1() => 1;
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment Object? instanceMethod2() => 1;
//                ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment dynamic instanceMethod3() => 1;
//                ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

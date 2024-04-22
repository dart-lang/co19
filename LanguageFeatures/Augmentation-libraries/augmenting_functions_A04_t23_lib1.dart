// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// - The signature of the function augmentation does not exactly match the
///   original function. This means the return types must be the same; there
///   must be the same number of positional, optional, and named parameters; the
///   types of corresponding positional and optional parameters must be the
///   same; the names and types of named parameters must be the same; any type
///   parameters and bounds must be the same; and any required or covariant
///   modifiers must match.
///
/// @description Checks that it is a compile-time error if type of parameters of
/// an augmentation doesn't exactly match the original function. Test top types
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

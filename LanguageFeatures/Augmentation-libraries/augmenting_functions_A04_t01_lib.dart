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
/// @description Checks that it is a compile-time error if return type of an
/// augmentation doesn't exactly match the original function
/// @author sgrekhov22@gmail.com
/// @issue 55478

// SharedOptions=--enable-experiment=macros

augment library 'augmenting_functions_A04_t01.dart';

augment Object topLevelFunction1() => "42";
//             ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment String topLevelFunction2() => "42";
//             ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment String? topLevelFunction3() => "42";
//              ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment String topLevelFunction4<T extends String>(T t) => "42";
//             ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment T topLevelFunction5<T extends String>(T t) => t;
//        ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment class C {
  augment static Object staticMethod1() => "42";
//                      ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static String staticMethod2() => "42";
//                      ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static String? staticMethod3() => "42";
//                       ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static String staticMethod4<T extends String>(T t) => "42";
//                      ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static T staticMethod5<T extends String>(T t) => t;
//                 ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment Object instanceMethod1() => "42";
//               ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment String instanceMethod2() => "42";
//               ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment String? instanceMethod3() => "42";
//                ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment String instanceMethod4<T extends String>(T t) => "42";
//               ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment T instanceMethod5<T extends String>(T t) => t;
//          ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment mixin M {
  augment static Object staticMethod1() => "42";
//                      ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static String staticMethod2() => "42";
//                      ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static String? staticMethod3() => "42";
//                       ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static String staticMethod4<T extends String>(T t) => "42";
//                      ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static T staticMethod5<T extends String>(T t) => t;
//                 ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment Object instanceMethod1() => "42";
//               ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment String instanceMethod2() => "42";
//               ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment String? instanceMethod3() => "42";
//                ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment String instanceMethod4<T extends String>(T t) => "42";
//               ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment T instanceMethod5<T extends String>(T t) => t;
//          ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment enum E {
  augment e1;

  augment static Object staticMethod1() => "42";
//                      ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static String staticMethod2() => "42";
//                      ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static String? staticMethod3() => "42";
//                       ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static String staticMethod4<T extends String>(T t) => "42";
//                      ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static T staticMethod5<T extends String>(T t) => t;
//                 ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment Object instanceMethod1() => "42";
//               ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment String instanceMethod2() => "42";
//               ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment String? instanceMethod3() => "42";
//                ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment String instanceMethod4<T extends String>(T t) => "42";
//               ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment T instanceMethod5<T extends String>(T t) => t;
//          ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension Ext {
  augment static Object staticMethod1() => "42";
//                      ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static String staticMethod2() => "42";
//                      ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static String? staticMethod3() => "42";
//                       ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static String staticMethod4<T extends String>(T t) => "42";
//                      ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static T staticMethod5<T extends String>(T t) => t;
//                 ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment Object instanceMethod1() => "42";
//               ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment String instanceMethod2() => "42";
//               ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment String? instanceMethod3() => "42";
//                ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment String instanceMethod4<T extends String>(T t) => "42";
//               ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment T instanceMethod5<T extends String>(T t) => t;
//          ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

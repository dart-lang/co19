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
/// @description Checks that it is a compile-time error if return type of an
/// augmentation doesn't exactly match the original function.
/// @author sgrekhov22@gmail.com
/// @issue 55478

// SharedOptions=--enable-experiment=macros

part of 'augmenting_functions_A04_t01.dart';

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

augment extension type ET {
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

// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that an augmenting function or constructor's signature
/// matches if:
/// - It has the same number of type parameters with the same type parameter
///   names (same identifiers) and bounds (after type annotation inheritance),
///   if any (same types, even if they may not be written exactly the same in
///   case one of the declarations needs to refer to a type using an import
///   prefix).
/// - The return type (if not omitted) is the same as the augmented
///   declaration's return type.
/// - It has the same number of positional and optional parameters as the
///   augmented declaration.
/// - It has the same set of named parameter names as the augmented declaration.
/// - For all corresponding pairs of parameters:
///   - They have the same type (if not omitted in the augmenting declaration).
///   - They have the same `required` and `covariant` modifiers.
/// - For all positional parameters:
///   - The augmenting function's parameter name is `_`, or
///   - The augmenting function's parameter name is the same as the name of the
///     corresponding positional parameter in every preceding declaration that
///     doesn't have `_` as its name.
/// ...
/// It's a compile-time error if:
/// - The signature of the augmenting function does not match the signature of
///   the augmented function.
///
/// @description Checks that it is a compile-time error if the return type of an
/// augmentation doesn't exactly match the original function. Test not the same
/// return types.
/// @author sgrekhov22@gmail.com
/// @issue 55478

// SharedOptions=--enable-experiment=augmentations

String topLevelFunction1() => "42";

augment Object topLevelFunction1();
//             ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

Object topLevelFunction2() => "42";

augment String topLevelFunction2();
//             ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

String topLevelFunction3() => "42";

augment String? topLevelFunction3();
//              ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

T topLevelFunction4<T extends String>(T t) => t;

augment String topLevelFunction4<T extends String>(T t);
//             ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

String topLevelFunction5<T extends String>(T t) => t;

augment T topLevelFunction5<T extends String>(T t);
//        ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class C {
  static String staticMethod1() => "42";
  static Object staticMethod2() => "42";
  static String staticMethod3() => "42";
  static T staticMethod4<T extends String>(T t) => t;
  static String staticMethod5<T extends String>(T t) => t;
  String instanceMethod1() => "42";
  Object instanceMethod2() => "42";
  String instanceMethod3() => "42";
  T instanceMethod4<T extends String>(T t) => t;
  String instanceMethod5<T extends String>(T t) => t;
}

augment class C {
  augment static Object staticMethod1();
//                      ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static String staticMethod2();
//                      ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static String? staticMethod3();
//                       ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static String staticMethod4<T extends String>(T t);
//                      ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static T staticMethod5<T extends String>(T t);
//                 ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment Object instanceMethod1();
//               ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment String instanceMethod2();
//               ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment String? instanceMethod3();
//                ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment String instanceMethod4<T extends String>(T t);
//               ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment T instanceMethod5<T extends String>(T t);
//          ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M {
  static String staticMethod1() => "42";
  static Object staticMethod2() => "42";
  static String staticMethod3() => "42";
  static T staticMethod4<T extends String>(T t) => t;
  static String staticMethod5<T extends String>(T t) => t;
  String instanceMethod1() => "42";
  Object instanceMethod2() => "42";
  String instanceMethod3() => "42";
  T instanceMethod4<T extends String>(T t) => t;
  String instanceMethod5<T extends String>(T t) => t;
}

augment mixin M {
  augment static Object staticMethod1();
//                      ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static String staticMethod2();
//                      ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static String? staticMethod3();
//                       ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static String staticMethod4<T extends String>(T t);
//                      ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static T staticMethod5<T extends String>(T t);
//                 ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment Object instanceMethod1();
//               ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment String instanceMethod2();
//               ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment String? instanceMethod3();
//                ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment String instanceMethod4<T extends String>(T t);
//               ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment T instanceMethod5<T extends String>(T t);
//          ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e1;

  static String staticMethod1() => "42";
  static Object staticMethod2() => "42";
  static String staticMethod3() => "42";
  static T staticMethod4<T extends String>(T t) => t;
  static String staticMethod5<T extends String>(T t) => t;
  String instanceMethod1() => "42";
  Object instanceMethod2() => "42";
  String instanceMethod3() => "42";
  T instanceMethod4<T extends String>(T t) => t;
  String instanceMethod5<T extends String>(T t) => t;
}

augment enum E {
  ;
  augment static Object staticMethod1();
//                      ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static String staticMethod2();
//                      ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static String? staticMethod3();
//                       ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static String staticMethod4<T extends String>(T t);
//                      ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static T staticMethod5<T extends String>(T t);
//                 ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment Object instanceMethod1();
//               ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment String instanceMethod2();
//               ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment String? instanceMethod3();
//                ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment String instanceMethod4<T extends String>(T t);
//               ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment T instanceMethod5<T extends String>(T t);
//          ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class A {}

extension Ext on A {
  static String staticMethod1() => "42";
  static Object staticMethod2() => "42";
  static String staticMethod3() => "42";
  static T staticMethod4<T extends String>(T t) => t;
  static String staticMethod5<T extends String>(T t) => t;
  String instanceMethod1() => "42";
  Object instanceMethod2() => "42";
  String instanceMethod3() => "42";
  T instanceMethod4<T extends String>(T t) => t;
  String instanceMethod5<T extends String>(T t) => t;
}

augment extension Ext {
  augment static Object staticMethod1();
//                      ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static String staticMethod2();
//                      ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static String? staticMethod3();
//                       ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static String staticMethod4<T extends String>(T t);
//                      ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static T staticMethod5<T extends String>(T t);
//                 ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment Object instanceMethod1();
//               ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment String instanceMethod2();
//               ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment String? instanceMethod3();
//                ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment String instanceMethod4<T extends String>(T t);
//               ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment T instanceMethod5<T extends String>(T t);
//          ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int _) {
  static String staticMethod1() => "42";
  static Object staticMethod2() => "42";
  static String staticMethod3() => "42";
  static T staticMethod4<T extends String>(T t) => t;
  static String staticMethod5<T extends String>(T t) => t;
  String instanceMethod1() => "42";
  Object instanceMethod2() => "42";
  String instanceMethod3() => "42";
  T instanceMethod4<T extends String>(T t) => t;
  String instanceMethod5<T extends String>(T t) => t;
}

augment extension type ET {
  augment static Object staticMethod1();
//                      ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static String staticMethod2();
//                      ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static String? staticMethod3();
//                       ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static String staticMethod4<T extends String>(T t);
//                      ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static T staticMethod5<T extends String>(T t);
//                 ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment Object instanceMethod1();
//               ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment String instanceMethod2();
//               ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment String? instanceMethod3();
//                ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment String instanceMethod4<T extends String>(T t);
//               ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment T instanceMethod5<T extends String>(T t);
//          ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(topLevelFunction1);
  print(topLevelFunction2);
  print(topLevelFunction3);
  print(topLevelFunction4);
  print(topLevelFunction5);
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}

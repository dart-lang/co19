// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that an augmenting function or constructor's signature
/// matches an introductory signature if:
/// - It has the same number of type parameters with the same type parameter
///   names (same identifiers) and bounds (after type annotation inheritance),
///   if any (same types, even if they may not be written exactly the same in
///   case one of the declarations needs to refer to a type using an import
///   prefix).
/// - The return type (if not omitted) is the same as the augmented
///   declaration's return type.
/// - It has the same number of positional parameters as the introductory
///   declaration, and the same number of those are optional.
/// - It has the same set of named parameter names as the augmented declaration.
/// - For each corresponding pair of parameters:
///   - They have the same name. This is trivial for named parameters, but may
///     fail to hold for positional parameters.
///   - They have the same type (or the augmenting declaration omits the type).
///   - They both have the modifier `covariant`, or none of them have it.
///   - They both have the modifier `required`. or none of them have it.
/// ...
/// It's a compile-time error if:
/// - The signature of the augmenting function does not match the signature of
///   the augmented function.
///
/// @description Checks that it is a compile-time error if the types of optional
/// parameters of an augmentation don't exactly match the original function.
/// @author sgrekhov22@gmail.com
/// @issue 55478

// SharedOptions=--enable-experiment=augmentations

void topLevelFunction1([int i = 1]) {}

augment void topLevelFunction1([Object i]);
//           ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

void topLevelFunction2([Object o = 2]) {}

augment void topLevelFunction2([int o]);
//           ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

void topLevelFunction3([String s = "3"]) {}

augment void topLevelFunction3([String? s]);
//           ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

void topLevelFunction4<T extends String>([T? t]) {}

augment void topLevelFunction4<T extends String>([String? t]);
//           ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

void topLevelFunction5<T extends String>([String? t]) {}

augment void topLevelFunction5<T extends String>([T? t]);
//           ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class C {
  static void staticMethod1([int i = 1]) {}
  static void staticMethod2([Object o = 2]) {}
  static void staticMethod3([String s = "3"]) {}
  static void staticMethod4<T extends String>([T? t]) {}
  static void staticMethod5<T extends String>([String? t]) {}
  void instanceMethod1([int i = 1]) {}
  void instanceMethod2([Object o = 2]) {}
  void instanceMethod3([String s = "3"]) {}
  void instanceMethod4<T extends String>([T? t]) {}
  void instanceMethod5<T extends String>([String? t]) {}
}

augment class C {
  augment static void staticMethod1([Object i]);
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod2([int o]);
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod3([String? s]);
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod4<T extends String>([String? t]);
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod5<T extends String>([T? t]);
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment void instanceMethod1([Object i]);
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod2([int o]);
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod3([String? s]);
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod4<T extends String>([String? t]);
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod5<T extends String>([T? t]);
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M {
  static void staticMethod1([int i = 1]) {}
  static void staticMethod2([Object o = 2]) {}
  static void staticMethod3([String s = "3"]) {}
  static void staticMethod4<T extends String>([T? t]) {}
  static void staticMethod5<T extends String>([String? t]) {}
  void instanceMethod1([int i = 1]) {}
  void instanceMethod2([Object o = 2]) {}
  void instanceMethod3([String s = "3"]) {}
  void instanceMethod4<T extends String>([T? t]) {}
  void instanceMethod5<T extends String>([String? t]) {}
}

augment mixin M {
  augment static void staticMethod1([Object i]);
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod2([int o]);
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod3([String? s]);
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod4<T extends String>([String? t]);
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod5<T extends String>([T? t]);
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment void instanceMethod1([Object i]);
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod2([int o]);
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod3([String? s]);
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod4<T extends String>([String? t]);
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod5<T extends String>([T? t]);
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e1;
  static void staticMethod1([int i = 1]) {}
  static void staticMethod2([Object o = 2]) {}
  static void staticMethod3([String s = "3"]) {}
  static void staticMethod4<T extends String>([T? t]) {}
  static void staticMethod5<T extends String>([String? t]) {}
  void instanceMethod1([int i = 1]) {}
  void instanceMethod2([Object o = 2]) {}
  void instanceMethod3([String s = "3"]) {}
  void instanceMethod4<T extends String>([T? t]) {}
  void instanceMethod5<T extends String>([String? t]) {}
}

augment enum E {
  ;
  augment static void staticMethod1([Object i]);
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod2([int o]);
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod3([String? s]);
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod4<T extends String>([String? t]);
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod5<T extends String>([T? t]);
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment void instanceMethod1([Object i]);
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod2([int o]);
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod3([String? s]);
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod4<T extends String>([String? t]);
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod5<T extends String>([T? t]);
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class A {}

extension Ext on A {
  static void staticMethod1([int i = 1]) {}
  static void staticMethod2([Object o = 2]) {}
  static void staticMethod3([String s = "3"]) {}
  static void staticMethod4<T extends String>([T? t]) {}
  static void staticMethod5<T extends String>([String? t]) {}
  void instanceMethod1([int i = 1]) {}
  void instanceMethod2([Object o = 2]) {}
  void instanceMethod3([String s = "3"]) {}
  void instanceMethod4<T extends String>([T? t]) {}
  void instanceMethod5<T extends String>([String? t]) {}
}

augment extension Ext {
  augment static void staticMethod1([Object i]);
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod2([int o]);
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod3([String? s]);
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod4<T extends String>([String? t]);
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod5<T extends String>([T? t]);
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment void instanceMethod1([Object i]);
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod2([int o]);
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod3([String? s]);
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod4<T extends String>([String? t]);
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod5<T extends String>([T? t]);
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int _) {
  static void staticMethod1([int i = 1]) {}
  static void staticMethod2([Object o = 2]) {}
  static void staticMethod3([String s = "3"]) {}
  static void staticMethod4<T extends String>([T? t]) {}
  static void staticMethod5<T extends String>([String? t]) {}
  void instanceMethod1([int i = 1]) {}
  void instanceMethod2([Object o = 2]) {}
  void instanceMethod3([String s = "3"]) {}
  void instanceMethod4<T extends String>([T? t]) {}
  void instanceMethod5<T extends String>([String? t]) {}
}

augment extension type ET {
  augment static void staticMethod1([Object i]);
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod2([int o]);
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod3([String? s]);
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod4<T extends String>([String? t]);
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod5<T extends String>([T? t]);
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment void instanceMethod1([Object i]);
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod2([int o]);
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod3([String? s]);
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod4<T extends String>([String? t]);
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod5<T extends String>([T? t]);
//             ^^^^^^^^^^^^^^^
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

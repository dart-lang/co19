// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The exact result of an `augmented` expression depends on what is
/// being augmented, but it generally follows the same rules as any normal
/// identifier:
/// ...
/// - Augmenting functions: When augmenting a function, `augmented` refers to
///   the augmented function. Tear offs are not allowed, so this function must
///   immediately be invoked.
///
/// @description Checks that it is a compile-time error if within an augmenting
/// function `augmented()` is invoked with actual parameters that don't match
/// the signature of the augmented function.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmented_expression_A04_t28.dart';

String topLevelFunction1(String value) => augmented();
//                                        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
String topLevelFunction2([String value]) => augmented("a", "b");
//                                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
String topLevelFunction3({String value}) => augmented("c");
//                                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
String topLevelFunction4({required String value}) => augmented(value: "d", "f");
//                                                   ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment class C {
  static String staticMethod1(String value) => augmented("a", "b");
//                                             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static String staticMethod2([String value]) => augmented(1);
//                                               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static String staticMethod3({String value}) => augmented(value: "c", "d");
//                                               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static String staticMethod4({required String value}) => augmented("e");
//                                                        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  String instanceMethod1(String value) => augmented(1);
//                                        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  String instanceMethod2([String value]) => augmented(null);
//                                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  String instanceMethod3({String value}) => augmented(value: 1);
//                                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  String instanceMethod4({required String value}) => augmented(value: null);
//                                                   ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment mixin M {
  static String staticMethod1(String value) => augmented("a", "b");
//                                             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static String staticMethod2([String value]) => augmented(1);
//                                               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static String staticMethod3({String value}) => augmented(value: "c", "d");
//                                               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static String staticMethod4({required String value}) => augmented("e");
//                                                        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  String instanceMethod1(String value) => augmented(1);
//                                        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  String instanceMethod2([String value]) => augmented(null);
//                                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  String instanceMethod3({String value}) => augmented(value: 1);
//                                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  String instanceMethod4({required String value}) => augmented(value: null);
//                                                   ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment enum E {
  augment e1;

  static String staticMethod1(String value) => augmented("a", "b");
//                                             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static String staticMethod2([String value]) => augmented(1);
//                                               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static String staticMethod3({String value}) => augmented(value: "c", "d");
//                                               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static String staticMethod4({required String value}) => augmented("e");
//                                                        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  String instanceMethod1(String value) => augmented(1);
//                                        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  String instanceMethod2([String value]) => augmented(null);
//                                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  String instanceMethod3({String value}) => augmented(value: 1);
//                                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  String instanceMethod4({required String value}) => augmented(value: null);
//                                                   ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension Ext {
  static String staticMethod1(String value) => augmented("a", "b");
//                                             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static String staticMethod2([String value]) => augmented(1);
//                                               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static String staticMethod3({String value}) => augmented(value: "c", "d");
//                                               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static String staticMethod4({required String value}) => augmented("e");
//                                                        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  String instanceMethod1(String value) => augmented(1);
//                                        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  String instanceMethod2([String value]) => augmented(null);
//                                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  String instanceMethod3({String value}) => augmented(value: 1);
//                                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  String instanceMethod4({required String value}) => augmented(value: null);
//                                                   ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

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

part 'augmented_expression_A04_t28_lib.dart';

String augmented() => "Global augmented() function, shouldn't be invoked";

String topLevelFunction1(String value) => value;
String topLevelFunction2([String value = "default"]) => value;
String topLevelFunction3({String value = "default"}) => value;
String topLevelFunction4({required String value}) => value;

class C {
  static String staticMethod1(String value) => value;
  static String staticMethod2([String value = "default"]) => value;
  static String staticMethod3({String value = "default"}) => value;
  static String staticMethod4({required String value}) => value;
  String instanceMethod1(String value) => value;
  String instanceMethod2([String value = "default"]) => value;
  String instanceMethod3({String value = "default"}) => value;
  String instanceMethod4({required String value}) => value;
}

mixin M {
  static String staticMethod1(String value) => value;
  static String staticMethod2([String value = "default"]) => value;
  static String staticMethod3({String value = "default"}) => value;
  static String staticMethod4({required String value}) => value;
  String instanceMethod1(String value) => value;
  String instanceMethod2([String value = "default"]) => value;
  String instanceMethod3({String value = "default"}) => value;
  String instanceMethod4({required String value}) => value;
}

enum E {
  e1;

  static String staticMethod1(String value) => value;
  static String staticMethod2([String value = "default"]) => value;
  static String staticMethod3({String value = "default"}) => value;
  static String staticMethod4({required String value}) => value;
  String instanceMethod1(String value) => value;
  String instanceMethod2([String value = "default"]) => value;
  String instanceMethod3({String value = "default"}) => value;
  String instanceMethod4({required String value}) => value;
}

class A {}

extension Ext on A {
  static String staticMethod1(String value) => value;
  static String staticMethod2([String value = "default"]) => value;
  static String staticMethod3({String value = "default"}) => value;
  static String staticMethod4({required String value}) => value;
  String instanceMethod1(String value) => value;
  String instanceMethod2([String value = "default"]) => value;
  String instanceMethod3({String value = "default"}) => value;
  String instanceMethod4({required String value}) => value;
}

extension type ET(int _) {
  static String staticMethod1(String value) => value;
  static String staticMethod2([String value = "default"]) => value;
  static String staticMethod3({String value = "default"}) => value;
  static String staticMethod4({required String value}) => value;
  String instanceMethod1(String value) => value;
  String instanceMethod2([String value = "default"]) => value;
  String instanceMethod3({String value = "default"}) => value;
  String instanceMethod4({required String value}) => value;
}

main() {
  print(topLevelFunction1("a"));
  print(topLevelFunction2("b"));
  print(topLevelFunction3(value:"c"));
  print(topLevelFunction4(value: "d"));
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}

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
/// @description Checks that within an augmenting function `augmented()` invokes
/// the augmented function with appropriate default values.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmented_expression_A04_t27.dart';

augment String topLevelFunction1(String value) =>
    augmented(value.toUpperCase());
augment String topLevelFunction2([String value]) =>
    augmented(value.toUpperCase());
augment String topLevelFunction3({String value}) =>
    augmented(value: value.toUpperCase());
augment String topLevelFunction4({required String value}) =>
    augmented(value: value.toUpperCase());

augment class C {
  augment  static String staticMethod1(String value) =>
      augmented(value.toUpperCase());
  augment static String staticMethod2([String value]) =>
      augmented(value.toUpperCase());
  augment static String staticMethod3({String value}) =>
      augmented(value: value.toUpperCase());
  augment static String staticMethod4({required String value}) =>
      augmented(value: value.toUpperCase());
  augment String instanceMethod1(String value) =>
      augmented(value.toUpperCase());
  augment String instanceMethod2([String value]) =>
      augmented(value.toUpperCase());
  augment String instanceMethod3({String value}) =>
      augmented(value: value.toUpperCase());
  augment String instanceMethod4({required String value}) =>
      augmented(value: value.toUpperCase());
}

augment mixin M {
  augment static String staticMethod1(String value) =>
      augmented(value.toUpperCase());
  augment static String staticMethod2([String value]) =>
      augmented(value.toUpperCase());
  augment static String staticMethod3({String value}) =>
      augmented(value: value.toUpperCase());
  augment static String staticMethod4({required String value}) =>
      augmented(value: value.toUpperCase());
  augment String instanceMethod1(String value) =>
      augmented(value.toUpperCase());
  augment String instanceMethod2([String value]) =>
      augmented(value.toUpperCase());
  augment String instanceMethod3({String value}) =>
      augmented(value: value.toUpperCase());
  augment String instanceMethod4({required String value}) =>
      augmented(value: value.toUpperCase());
}

augment enum E {
  augment e1;

  augment static String staticMethod1(String value) =>
      augmented(value.toUpperCase());
  augment static String staticMethod2([String value]) =>
      augmented(value.toUpperCase());
  augment static String staticMethod3({String value}) =>
      augmented(value: value.toUpperCase());
  augment static String staticMethod4({required String value}) =>
      augmented(value: value.toUpperCase());
  augment String instanceMethod1(String value) =>
      augmented(value.toUpperCase());
  augment String instanceMethod2([String value]) =>
      augmented(value.toUpperCase());
  augment String instanceMethod3({String value}) =>
      augmented(value: value.toUpperCase());
  augment String instanceMethod4({required String value}) =>
      augmented(value: value.toUpperCase());
}

augment extension Ext {
  augment static String staticMethod1(String value) =>
      augmented(value.toUpperCase());
  augment static String staticMethod2([String value]) =>
      augmented(value.toUpperCase());
  augment static String staticMethod3({String value}) =>
      augmented(value: value.toUpperCase());
  augment static String staticMethod4({required String value}) =>
      augmented(value: value.toUpperCase());
  augment String instanceMethod1(String value) =>
      augmented(value.toUpperCase());
  augment String instanceMethod2([String value]) =>
      augmented(value.toUpperCase());
  augment String instanceMethod3({String value}) =>
      augmented(value: value.toUpperCase());
  augment String instanceMethod4({required String value}) =>
      augmented(value: value.toUpperCase());
}

augment extension type ET {
  augment static String staticMethod1(String value) =>
      augmented(value.toUpperCase());
  augment static String staticMethod2([String value]) =>
      augmented(value.toUpperCase());
  augment static String staticMethod3({String value}) =>
      augmented(value: value.toUpperCase());
  augment static String staticMethod4({required String value}) =>
      augmented(value: value.toUpperCase());
  augment String instanceMethod1(String value) =>
      augmented(value.toUpperCase());
  augment String instanceMethod2([String value]) =>
      augmented(value.toUpperCase());
  augment String instanceMethod3({String value}) =>
      augmented(value: value.toUpperCase());
  augment String instanceMethod4({required String value}) =>
      augmented(value: value.toUpperCase());
}

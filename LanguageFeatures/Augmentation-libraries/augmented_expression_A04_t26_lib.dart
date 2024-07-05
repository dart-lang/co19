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

augment library 'augmented_expression_A04_t26.dart';

augment String topLevelFunction1([String value]) => augmented();
augment String topLevelFunction2({String value}) => augmented();

augment class C {
  augment static String staticMethod1([String value]) => augmented();
  augment static String staticMethod2({String value}) => augmented();
  augment String instanceMethod1([String value]) => augmented();
  augment String instanceMethod2({String value}) => augmented();
}

augment mixin M {
  augment static String staticMethod1([String value]) => augmented();
  augment static String staticMethod2({String value}) => augmented();
  augment String instanceMethod1([String value]) => augmented();
  augment String instanceMethod2({String value}) => augmented();
}

augment enum E {
  augment e1;

  augment static String staticMethod1([String value]) => augmented();
  augment static String staticMethod2({String value}) => augmented();
  augment String instanceMethod1([String value]) => augmented();
  augment String instanceMethod2({String value}) => augmented();
}

augment extension Ext {
  augment static String staticMethod1([String value]) => augmented();
  augment static String staticMethod2({String value}) => augmented();
  augment String instanceMethod1([String value]) => augmented();
  augment String instanceMethod2({String value}) => augmented();
}

// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The exact result of an `augmented` expression depends on what is
/// being augmented, but it generally follows the same rules as any normal
/// identifier:
/// ...
/// - Augmenting functions: Inside an augmenting function body (including
///   factory constructors but not generative constructors) `augmented` refers
///   to the augmented function. Tear-offs are not allowed, and this function
///   must immediately be invoked.
///
/// @description Checks that it's not an error to augment a function whose
/// default value of a formal parameter is a constant with the name `augmented`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmented_expression_A04_t35.dart';

augment String topLevelFunction1([String v]) => "Augmented: $v";
augment String topLevelFunction2({String v}) => "Augmented: $v";

augment class C {
  augment factory C.f1([String v = augmented]) => C("Augmented: $v");
  augment factory C.f2({String v = augmented}) => C("Augmented: $v");
  augment static String staticMethod1([String v]) => "Augmented: $v";
  augment static String staticMethod2({String v}) => "Augmented: $v";
  augment String instanceMethod1([String v]) => "Augmented: $v";
  augment String instanceMethod2({String v}) => "Augmented: $v";
}

augment mixin M {
  augment static String staticMethod1([String v]) => "Augmented: $v";
  augment static String staticMethod2({String v}) => "Augmented: $v";
  augment String instanceMethod1([String v]) => "Augmented: $v";
  augment String instanceMethod2({String v}) => "Augmented: $v";
}

augment enum E {
  augment e1;
  augment static String staticMethod1([String v]) => "Augmented: $v";
  augment static String staticMethod2({String v}) => "Augmented: $v";
  augment String instanceMethod1([String v]) => "Augmented: $v";
  augment String instanceMethod2({String v}) => "Augmented: $v";
}

augment extension Ext {
  augment static String staticMethod1([String v]) => "Augmented: $v";
  augment static String staticMethod2({String v}) => "Augmented: $v";
  augment String instanceMethod1([String v]) => "Augmented: $v";
  augment String instanceMethod2({String v}) => "Augmented: $v";
}

augment extension type ET {
  augment factory ET.f1([String v = augmented]) => ET("Augmented: $v");
  augment factory ET.f2({String v = augmented}) => ET("Augmented: $v");
  augment static String staticMethod1([String v]) => "Augmented: $v";
  augment static String staticMethod2({String v}) => "Augmented: $v";
  augment String instanceMethod1([String v]) => "Augmented: $v";
  augment String instanceMethod2({String v}) => "Augmented: $v";
}

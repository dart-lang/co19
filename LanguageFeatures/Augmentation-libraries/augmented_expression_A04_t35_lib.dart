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
/// @description Checks that it's not an error to augment function whose default
/// value of a formal parameters is a constant with the name `augmented`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmented_expression_A04_t35.dart';

augment String topLevelFunction1([String v]) => "Augmented: $v";
augment String topLevelFunction2({String v}) => "Augmented: $v";

augment class C {
  static String staticMethod1([String v]) => "Augmented: $v";
  static String staticMethod2({String v}) => "Augmented: $v";
  String instanceMethod1([String v]) => "Augmented: $v";
  String instanceMethod2({String v}) => "Augmented: $v";
}

augment mixin M {
  static String staticMethod1([String v]) => "Augmented: $v";
  static String staticMethod2({String v}) => "Augmented: $v";
  String instanceMethod1([String v]) => "Augmented: $v";
  String instanceMethod2({String v}) => "Augmented: $v";
}

augment enum E {
  augment e1;
  static String staticMethod1([String v]) => "Augmented: $v";
  static String staticMethod2({String v}) => "Augmented: $v";
  String instanceMethod1([String v]) => "Augmented: $v";
  String instanceMethod2({String v}) => "Augmented: $v";
}

augment extension Ext {
  static String staticMethod1([String v]) => "Augmented: $v";
  static String staticMethod2({String v}) => "Augmented: $v";
  String instanceMethod1([String v]) => "Augmented: $v";
  String instanceMethod2({String v}) => "Augmented: $v";
}

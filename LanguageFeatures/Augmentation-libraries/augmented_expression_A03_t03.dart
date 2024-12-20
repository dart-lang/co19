// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The exact result of an `augmented` expression depends on what is
/// being augmented, but it generally follows the same rules as any normal
/// identifier:
/// ...
/// - Augmenting fields: Within an augmenting variable declaration, `augmented`
///   can only be used in an initializer expression, and refers to the augmented
///   variable's initializing expression, which is immediately evaluated.
///
/// It is a compile-time error to use `augmented` in an augmenting variable's
/// initializer if the member being augmented is not a variable declaration with
/// an initializing expression.
///
/// @description Checks that it is a compile-time error to use `augmented()`
/// within an augmenting field if the original field's initializer expression is
/// not callable
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part 'augmented_expression_A03_t03_lib.dart';

String augmented() => "Top-level augmented(), shouldn't be invoked";

String topLevelVariable = "Original";
final String finalTopLevelVariable = "Original";

class C {
  static String staticVariable = "Original";
  static final String finalStaticVariable = "Original";
  String instanceVariable = "Original";
  final String finalInstanceVariable = "Original";
  String augmented() => "C.augmented(), shouldn't be invoked";
}

mixin M {
  static String staticVariable = "Original";
  static final String finalStaticVariable = "Original";
  String instanceVariable = "Original";
  final String finalInstanceVariable = "Original";
  String augmented() => "M.augmented(), shouldn't be invoked";
}

enum E {
  e1;

  static String staticVariable = "Original";
  static final String finalStaticVariable = "Original";
  final String finalInstanceVariable = "Original";
  String augmented() => "E.augmented(), shouldn't be invoked";
}

class A {}

extension Ext on A {
  static String staticVariable = "Original";
  static final String finalStaticVariable = "Original";
  static String augmented() => "Ext.augmented(), shouldn't be invoked";
}

extension type ET(int _) {
  static String staticVariable = "Original";
  static final String finalStaticVariable = "Original";
  static String augmented() => "Ext.augmented(), shouldn't be invoked";
}

main() {
  print(topLevelVariable);
  print(finalTopLevelVariable);
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}

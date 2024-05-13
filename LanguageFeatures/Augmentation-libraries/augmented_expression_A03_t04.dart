// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The exact result of an `augmented` expression depends on what is
/// being augmented, but it generally follows the same rules as any normal
/// identifier:
/// ...
/// - Augmenting fields: Within an augmenting field, augmented can only be used
///   in an initializer expression, and refers to the original field's
///   initializer expression, which is immediately evaluated.
///
/// It is a compile-time error to use augmented in an augmenting field's
/// initializer if the member being augmented is not a field with an initializer
///
/// @description Checks that it is a compile-time error to use `augmented=`
/// setter within an augmenting field
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmented_expression_A03_t04_lib.dart';

void set augmented(String _) {}

String topLevelVariable = "Original";
final String finalTopLevelVariable = "Original";

class C {
  static String staticVariable = "Original";
  static final String finalStaticVariable = "Original";
  String instanceVariable = "Original";
  final String finalInstanceVariable = "Original";
  static void set augmented(String _) {}
}

mixin M {
  static String staticVariable = "Original";
  static final String finalStaticVariable = "Original";
  String instanceVariable = "Original";
  final String finalInstanceVariable = "Original";
  static void set augmented(String _) {}
}

enum E {
  e1;

  static String staticVariable = "Original";
  static final String finalStaticVariable = "Original";
  final String finalInstanceVariable = "Original";
  void set augmented(String _) {}
}

class A {}

extension Ext on A {
  static String staticVariable = "Original";
  static final String finalStaticVariable = "Original";
  static void set augmented(String _) {}
}

main() {
  print(topLevelVariable);
  print(finalTopLevelVariable);
  print(C);
  print(M);
  print(E);
  print(A);
}

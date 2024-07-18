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
/// @description Checks that it is a compile-time error if an `augmented` is
/// used in an augmenting field's initializer and the member being augmented is
/// a late field with no initializer.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmented_expression_A03_t09_lib.dart';

const augmented = "Augmented constant, should not be used";

late String? topLevelVariable;

class C {
  static late String? staticVariable;
  late String? instanceVariable;
  final augmented = "C.augmented, should not be used";
}

mixin M {
  static late String? staticVariable;
  late String? instanceVariable;
  final augmented = "M.augmented, should not be used";
}

enum E {
  e1;
  static late String? staticVariable;
  static final augmented = "E.augmented, should not be used";
}

class A {}

extension Ext on A {
  static late String? staticVariable;
  static final augmented = "Ext.augmented, should not be used";
}

main() {
  topLevelVariable;
  print(C);
  print(M);
  print(E);
  print(A);
}

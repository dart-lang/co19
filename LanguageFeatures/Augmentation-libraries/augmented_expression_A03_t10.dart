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
/// It is a compile-time error to use `augmented` in an augmenting field's
/// initializer if the member being augmented is not a field with an initializer
///
/// @description Checks that it is a compile-time error to use `augmented` in an
/// augmenting field's initializer if the member being augmented is not a field
/// with an initializer and the variable's type is not-nullable
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmented_expression_A03_t10_lib.dart';

const augmented = "Augmented constant, should not be used";

class C {
  String instanceVariable;
  final String finalInstanceVariable;
  final augmented = "C.augmented, should not be used";
  C(this.instanceVariable, this.finalInstanceVariable);
}

enum E {
  e1("x");
  final String finalInstanceVariable;
  final augmented = "E.augmented, should not be used";
  const E(this.finalInstanceVariable);
}

main() {
  print(C);
  print(E);
}

// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The exact result of an `augmented` expression depends on what is
/// being augmented, but it generally follows the same rules as any normal
/// identifier:
/// ...
/// - Augmenting operators: When augmenting an operator, `augmented` must be
///   followed by the operator. For example when augmenting `+` you must do
///   `augmented + 1`, and when augmenting `[]` you must do `augmented[<arg>]`.
///   These constructs invoke the augmented operator, and are the only valid
///   uses of `augmented` in these contexts.
///
/// @description Checks that it is a compile-time error to tear-off `augmented`
/// expression inside of an augmenting operator.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmented_expression_A05_t01_lib1.dart';
import augment 'augmented_expression_A05_t01_lib2.dart';

const augmented = "Augmented constant, should not be used";

class C {
  int operator +(Object other) => 42;
  final augmented = "C.augmented, should not be used";
}

mixin M {
  int operator +(Object other);
  final augmented = "M.augmented, should not be used";
}

enum E {
  e1;
  int operator +(Object other) => 42;
  final augmented = "E.augmented, should not be used";
}

class A {
  final augmented = "A.augmented, should not be used";
}

extension Ext on A {
  int operator +(Object other) => 42;
}

main() {
  print(C);
  print(M);
  print(E);
  print(A);
}

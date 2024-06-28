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
/// @description Checks that it is a compile-time error to call an `augmented`
/// inside an augmenting operator followed by another operator.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmented_expression_A05_t11_lib.dart';

const augmented = 0;

class C {
  int operator +(num other) => 1;
  int operator -(num other) => 2;
  final augmented = 3;
}

mixin M {
  int operator +(num other) => 1;
  int operator -(num other) => 2;
  final augmented = 3;
}

enum E {
  e1;
  int operator +(num other) => 1;
  int operator -(num other) => 2;
  final augmented = 3;
}

class A {
  final augmented = 3;
}

extension Ext on A {
  int operator +(num other) => 1;
  int operator -(num other) => 2;
}

main() {
  print(C);
  print(M);
  print(E);
  print(A);
}

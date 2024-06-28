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
/// @description Checks that it is a compile-time error call `augmented()` as a
/// method inside of an augmenting operator.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmented_expression_A05_t02_lib.dart';

String augmented(Object other) => "Top-level augmented(), should not be used";

class C {
  String operator +(Object other) => "C";
  String augmented(Object other) => "C.augmented(), should not be used";
}

mixin M {
  String operator +(Object other);
  String augmented(Object other) => "M.augmented(), should not be used";
}

enum E {
  e1;
  String operator +(Object other) => "E";
  String augmented(Object other) => "E.augmented(), should not be used";
}

class A {
  String augmented(Object other) => "A.augmented(), should not be used";
}

extension Ext on A {
  String operator +(Object other) => "Ext";
}

main() {
  print(C);
  print(M);
  print(E);
  print(A);
}

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
/// @description Checks that it is a compile-time error if an augmenting
/// operator has a return type whose name is `augmented`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmented_expression_A05_t17_lib.dart';

class augmented {}

class C {
  augmented? operator +(Object? other) => null;
  augmented? operator [](int index) => null;
}

mixin M {
  augmented? operator +(Object? other) => null;
  augmented? operator [](int index) => null;
}

enum E {
  e1;
  augmented? operator +(Object? other) => null;
  augmented? operator [](int index) => null;
}

class A {
}

extension Ext on A {
  augmented? operator +(Object? other) => null;
  augmented? operator [](int index) => null;
}

main() {
  print(C);
  print(M);
  print(E);
  print(A);
}

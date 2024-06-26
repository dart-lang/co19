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
/// @description Checks that it is a compile-time error to declare a local
/// variable named `augmented` inside of an augmenting operator. Test a list
/// pattern.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmented_expression_A05_t07_lib.dart';

class C {
  String operator +(Object other) => "C";
}

mixin M {
  String operator +(Object other);
}

enum E {
  e1;
  String operator +(Object other) => "E";
}

class A {}

extension Ext on A {
  String operator +(Object other) => "Ext";
}

main() {
  print(C);
  print(M);
  print(E);
  print(A);
}

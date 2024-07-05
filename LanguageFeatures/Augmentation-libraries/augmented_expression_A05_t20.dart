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
/// @description Checks that within an augmenting operator `augmented` invokes
/// the augmented one and evaluates it to the return value. Test a local
/// function.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmented_expression_A05_t20_lib.dart';
import '../../Utils/expect.dart';

class C {
  String operator +(Object? other) => "Original + $other";
  String operator [](int index) => "Original [$index]";
}

mixin M {
  String operator +(Object? other) => "Original + $other";
  String operator [](int index) => "Original [$index]";
}

enum E {
  e1;
  String operator +(Object? other) => "Original + $other";
  String operator [](int index) => "Original [$index]";
}

class A {}

extension Ext on A {
  String operator +(Object? other) => "Original + $other";
  String operator [](int index) => "Original [$index]";
}

class MA = Object with M;

main() {
  Expect.equals("Augmented: Original + 1", C() + 1);
  Expect.equals("Augmented: Original [2]", C()[2]);
  Expect.equals("Augmented: Original + 3", MA() + 3);
  Expect.equals("Augmented: Original [4]", MA()[4]);
  Expect.equals("Augmented: Original + 5", E.e1 + 5);
  Expect.equals("Augmented: Original [6]", E.e1[6]);
  Expect.equals("Augmented: Original + 7", A() + 7);
  Expect.equals("Augmented: Original [8]", A()[8]);
}

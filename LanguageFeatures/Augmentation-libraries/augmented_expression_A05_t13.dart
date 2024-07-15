// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The exact result of an `augmented` expression depends on what is
/// being augmented, but it generally follows the same rules as any normal
/// identifier:
/// ...
/// - Augmenting operators: When augmenting an operator, augmented refers to the
///   augmented operator method, which must be immediately invoked using
///   function call syntax. For example when augmenting `operator +` you would
///   use `augmented(1)` to call the augmented operator, and when augmenting
///   `operator []=` you would use the `augmented(key, value)` syntax.
///
/// @description Checks that `augmented(v)` inside of an augmenting operator
/// invokes an augmented operator `+` with `v` as an argument.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmented_expression_A05_t13_lib1.dart';
import augment 'augmented_expression_A05_t13_lib2.dart';
import '../../Utils/expect.dart';

const augmented = "Top-level constant, should not be used";

class C {
  String operator +(Object other) => "C + $other";
  final augmented = "C.augmented, should not be used";
}

mixin M {
  String operator +(Object other) => "M + $other";
  final augmented = "M.augmented, should not be used";
}

enum E {
  e1;
  String operator +(Object other) => "E + $other";
  final augmented = "E.augmented, should not be used";
}

class A {
  final augmented = "A.augmented, should not be used";
}

extension Ext on A {
  String operator +(Object other) => "Ext + $other";
}

class MA = Object with M;

main() {
  Expect.equals("C: Augment2 + 1", C() + 1);
  Expect.equals("M: Augment2 + 2", MA() + 2);
  Expect.equals("E: Augment2 + 3", E.e1 + 3);
  Expect.equals("Ext: Augment2 + 4", A() + 4);
}

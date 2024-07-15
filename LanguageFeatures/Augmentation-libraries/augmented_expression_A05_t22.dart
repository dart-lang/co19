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
/// @description Checks that within an augmenting operator `augmented` invokes
/// the augmented one and evaluates it to the return value. Test a function
/// literal.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmented_expression_A05_t22_lib.dart';
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

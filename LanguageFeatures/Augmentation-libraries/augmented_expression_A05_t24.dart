// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The exact result of an `augmented` expression depends on what is
/// being augmented, but it generally follows the same rules as any normal
/// identifier:
/// ...
/// - Augmenting operators: When augmenting an operator, `augmented` refers to
///   the augmented operator method, which must be immediately invoked using
///   function call syntax. For example when augmenting `operator +` you would
///   use `augmented(1)` to call the augmented operator, and when augmenting
///   `operator []=` you would use the `augmented(key, value)` syntax.
///
/// @description Checks that it is a compile-time error to use `augmented` as a
/// constant value in a switch expressions and statements.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmented_expression_A05_t24_lib.dart';

const augmented = "Constant augmented, shouldn't be used";

class C {
  String operator +(Object? other) => "Original + $other";
}

mixin M {
  String operator +(Object? other) => "Original + $other";
}

enum E {
  e1;
  String operator +(Object? other) => "Original + $other";
}

class A {}

extension Ext on A {
  String operator +(Object? other) => "Original + $other";
}

main() {
  print(C);
  print(M);
  print(E);
  print(A);
}

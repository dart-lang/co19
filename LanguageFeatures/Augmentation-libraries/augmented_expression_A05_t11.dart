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
/// @description Checks that it is a compile-time error to call an `augmented`
/// inside an augmenting operator followed by another operator.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part 'augmented_expression_A05_t11_lib.dart';

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

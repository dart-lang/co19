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
/// @description Checks that it is a compile-time error to call a function which
/// has a named formal parameter with the name `augmented` in an augmenting
/// operator body.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part 'augmented_expression_A05_t18_lib.dart';

int foo({int augmented = 0}) => augmented + 42;

class C {
  int operator +(Object? other) => 0;
  int operator [](int index) => 0;
  void operator []=(int index, int value) {}
}

mixin M {
  int operator +(Object? other) => 0;
  int operator [](int index) => 0;
  void operator []=(int index, int value) {}
}

enum E {
  e1;
  int operator +(Object? other) => 0;
  int operator [](int index) => 0;
  void operator []=(int index, int value) {}
}

class A {
}

extension Ext on A {
  int operator +(Object? other) => 0;
  int operator [](int index) => 0;
  void operator []=(int index, int value) {}
}

main() {
  print(C);
  print(M);
  print(E);
  print(A);
}

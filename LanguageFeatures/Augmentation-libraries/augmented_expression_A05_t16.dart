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
/// @description Checks that it is a compile-time error if an augmenting
/// operator has a parameter with a type whose name is `augmented`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part 'augmented_expression_A05_t16_lib.dart';

class augmented {}

class C {
  String operator +(augmented other) => "C +";
  String operator [](augmented index) => "C[]";
  void operator []=(augmented index, String value) {}
}

mixin M {
  String operator +(augmented other) => "M +";
  String operator [](augmented index) => "M[]";
  void operator []=(int index, augmented value) {}
}

enum E {
  e1;
  String operator +(augmented other) => "E +";
  String operator [](augmented index) => "E[]";
  void operator []=(augmented index, String value) {}
}

class A {
}

extension Ext on A {
  String operator +(augmented other) => "Ext +";
  String operator [](augmented index) => "Ext[]";
  void operator []=(int index, augmented value) {}
}

main() {
  print(C);
  print(M);
  print(E);
  print(A);
}

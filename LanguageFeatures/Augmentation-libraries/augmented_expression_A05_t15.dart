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
/// operator has a parameter whose name is `augmented`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmented_expression_A05_t15_lib.dart';

class C {
  String operator +(Object augmented) => "C +";
  String operator [](int augmented) => "C[]";
  void operator []=(int augmented, String value) {}
}

mixin M {
  String operator +(Object augmented) => "M +";
  String operator [](int augmented) => "M[]";
  void operator []=(int index, String augmented) {}
}

enum E {
  e1;
  String operator +(Object augmented) => "E +";
  String operator [](int augmented) => "E[]";
  void operator []=(int augmented, String value) {}
}

class A {
}

extension Ext on A {
  String operator +(Object augmented) => "Ext +";
  String operator [](int augmented) => "Ext[]";
  void operator []=(int index, String augmented) {}
}

main() {
  print(C);
  print(M);
  print(E);
  print(A);
}

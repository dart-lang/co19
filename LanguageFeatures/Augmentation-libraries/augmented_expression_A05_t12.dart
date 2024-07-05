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
/// @description Checks that it is a compile-time error to call an `augmented`
/// inside an augmenting operator followed by another operator.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmented_expression_A05_t12_lib.dart';

var augmented = ["Top-level augmented", "should", "not", "be", "used"];

class C {
  String operator [](int index) => "C[$index]";
  void operator []=(int index, String value) => "C[$index]=$value";
  List<String> augmented = ["C.augmented", "should", "not", "be", "used"];
}

mixin M {
  String operator [](int index) => "M[$index]";
  void operator []=(int index, String value) => "M[$index]=$value";
  List<String> augmented = ["M.augmented", "should", "not", "be", "used"];
}

enum E {
  e1;
  String operator [](int index) => "E[$index]";
  void operator []=(int index, String value) => "E[$index]=$value";
  List<String> augmented = ["E.augmented", "should", "not", "be", "used"];
}

class A {}

extension Ext on A {
  String operator [](int index) => "Ext[$index]";
  void operator []=(int index, String value) => "Ext[$index]=$value";
  List<String> get augmented => ["Ext.augmented", "should", "not", "be", "used"];
}

main() {
  print(C);
  print(M);
  print(E);
  print(A);
}

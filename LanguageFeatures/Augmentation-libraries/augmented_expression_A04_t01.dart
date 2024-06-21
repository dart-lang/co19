// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The exact result of an `augmented` expression depends on what is
/// being augmented, but it generally follows the same rules as any normal
/// identifier:
/// ...
/// - Augmenting functions: When augmenting a function, `augmented` refers to
///   the augmented function. Tear offs are not allowed, so this function must
///   immediately be invoked.
///
/// @description Checks that it is a compile-time error to tear-off `augmented`
/// expression inside of an augmenting function
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmented_expression_A04_t01_lib1.dart';
import augment 'augmented_expression_A04_t01_lib2.dart';

const augmented = "Augmented constant, should not be used";

void topLevelFunction() {}

class C {
  static void staticMethod() {}
  void instanceMethod() {}
  final augmented = "C.augmented, should not be used";
}

mixin M {
  static void staticMethod() {}
  void instanceMethod() {}
  final augmented = "M.augmented, should not be used";
}

enum E {
  e1;

  static void staticMethod() {}
  void instanceMethod() {}
  final augmented = "E.augmented, should not be used";
}

class A {}

extension Ext on A {
  static void staticMethod() {}
  void instanceMethod() {}
  final augmented = "Ext.augmented, should not be used";
}

main() {
  print(topLevelFunction);
  print(C);
  print(M);
  print(E);
  print(A);
}

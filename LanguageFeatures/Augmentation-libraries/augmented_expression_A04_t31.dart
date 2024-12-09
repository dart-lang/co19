// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The exact result of an `augmented` expression depends on what is
/// being augmented, but it generally follows the same rules as any normal
/// identifier:
/// ...
/// - Augmenting functions: Inside an augmenting function body (including
///   factory constructors but not generative constructors) `augmented` refers
///   to the augmented function. Tear-offs are not allowed, and this function
///   must immediately be invoked.
///
/// @description Checks that it is a compile-time error to use `augmented` as a
/// constant value in a switch expressions and statements.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part 'augmented_expression_A04_t31_lib.dart';

const augmented = "Constant augmented, shouldn't be used";

void topLevelFunction() {}

class C {
  static void staticMethod() {}
  void instanceMethod() {}
}

mixin M {
  static void staticMethod() {}
  void instanceMethod() {}
}

enum E {
  e1;

  static void staticMethod() {}
  void instanceMethod() {}
}

class A {}

extension Ext on A {
  static void staticMethod() {}
  void instanceMethod() {}
}

extension type ET(int _) {
  static void staticMethod() {}
  void instanceMethod() {}
}

main() {
  print(topLevelFunction);
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}

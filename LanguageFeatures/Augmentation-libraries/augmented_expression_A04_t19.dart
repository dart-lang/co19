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
/// @description Checks that it is a compile-time error for an augmenting
/// function to have as a parameter of a type whose name is `augmented`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part 'augmented_expression_A04_t19_lib.dart';

class augmented {}

void topLevelFunction(augmented x) {}

class C {
  static void staticMethod(augmented x) {}
  void instanceMethod(augmented x) {}
}

mixin M {
  static void staticMethod(augmented x) {}
  void instanceMethod(augmented x) {}
}

enum E {
  e1;

  static void staticMethod(augmented x) {}
  void instanceMethod(augmented x) {}
}

class A {}

extension Ext on A {
  static void staticMethod(augmented x) {}
  void instanceMethod(augmented x) {}
}

extension type ET(int _) {
  static void staticMethod(augmented x) {}
  void instanceMethod(augmented x) {}
}

main() {
  print(topLevelFunction);
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}

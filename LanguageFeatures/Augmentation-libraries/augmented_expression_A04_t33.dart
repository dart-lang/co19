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
/// @description Checks that it is a compile-time error to declare an augmenting
/// function with `augmented` as a type bound.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part 'augmented_expression_A04_t33_lib.dart';

class augmented {}

void topLevelFunction<T extends augmented>() {}

class C {
  static void staticMethod<T extends augmented>() {}
  void instanceMethod<T extends augmented>() {}
}

mixin M {
  static void staticMethod<T extends augmented>() {}
  void instanceMethod<T extends augmented>() {}
}

enum E {
  e1;
  static void staticMethod<T extends augmented>() {}
  void instanceMethod<T extends augmented>() {}
}

class A {}

extension Ext on A {
  static void staticMethod<T extends augmented>() {}
  void instanceMethod<T extends augmented>() {}
}

main() {
  print(topLevelFunction);
  print(C);
  print(M);
  print(E);
  print(A);
}

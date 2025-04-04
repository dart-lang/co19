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
/// function to have as an optional positional parameter a record with a named
/// field with the name `augmented`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part 'augmented_expression_A04_t16_lib.dart';

void topLevelFunction([({int augmented}) r = (augmented: 0)]) {}

class C {
  C();
  factory C.f([({int augmented}) r = (augmented: 0)]) => C();
  static void staticMethod([({int augmented}) r = (augmented: 0)]) {}
  void instanceMethod([({int augmented}) r = (augmented: 0)]) {}
}

mixin M {
  static void staticMethod([({int augmented}) r = (augmented: 0)]) {}
  void instanceMethod([({int augmented}) r = (augmented: 0)]) {}
}

enum E {
  e1;

  static void staticMethod([({int augmented}) r = (augmented: 0)]) {}
  void instanceMethod([({int augmented}) r = (augmented: 0)]) {}
}

class A {}

extension Ext on A {
  static void staticMethod([({int augmented}) r = (augmented: 0)]) {}
  void instanceMethod([({int augmented}) r = (augmented: 0)]) {}
}

extension type ET(int _) {
  factory ET.f([({int augmented}) r = (augmented: 0)]) => ET(0);
  static void staticMethod([({int augmented}) r = (augmented: 0)]) {}
  void instanceMethod([({int augmented}) r = (augmented: 0)]) {}
}

main() {
  print(topLevelFunction);
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}

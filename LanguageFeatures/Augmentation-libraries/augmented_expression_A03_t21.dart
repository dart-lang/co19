// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The exact result of an `augmented` expression depends on what is
/// being augmented, but it generally follows the same rules as any normal
/// identifier:
/// ...
/// - Augmenting fields: Within an augmenting variable declaration, `augmented`
///   can only be used in an initializer expression, and refers to the augmented
///   variable's initializing expression, which is immediately evaluated.
///
/// It is a compile-time error to use `augmented` in an augmenting variable's
/// initializer if the member being augmented is not a variable declaration with
/// an initializing expression.
///
/// @description Checks that it is a compile-time error if an augmenting field
/// has a type whose name is `augmented`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part 'augmented_expression_A03_t21_lib.dart';

class augmented {}

augmented? topLevelVariable = null;

class C {
  static augmented? staticVariable = null;
  augmented? instanceVariable = null;
}

mixin M {
  static augmented? staticVariable = null;
  augmented? instanceVariable = null;
}

enum E {
  e1;
  static augmented? staticVariable = null;
}

class A {}

extension Ext on A {
  static augmented? staticVariable = null;
}

extension type ET(int _) {
  static augmented? staticVariable = null;
}

main() {
  print(topLevelVariable);
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}

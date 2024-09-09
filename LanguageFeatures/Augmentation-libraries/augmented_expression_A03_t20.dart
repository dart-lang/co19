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
/// @description Checks that it is a compile-time error to declare a local
/// variable named `augmented` in an augmenting field initializer. Test an
/// object pattern.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part 'augmented_expression_A03_t20_lib.dart';

Function? topLevelVariable = () {};

class C {
  static Function? staticVariable = () {};
  Function? instanceVariable = () {};
}

mixin M {
  static Function? staticVariable = () {};
  Function? instanceVariable = () {};
}

enum E {
  e1;
  static Function? staticVariable = () {};
}

class A {}

extension Ext on A {
  static Function? staticVariable = () {};
}

main() {
  print(topLevelVariable);
  print(C);
  print(M);
  print(E);
  print(A);
}

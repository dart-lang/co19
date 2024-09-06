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
/// @description Checks that it is a compile-time error to augment a variable or
/// a field named `augmented`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part 'augmented_expression_A03_t24_lib.dart';

String augmented = "Top-level variable";

class C1 {
  static String augmented = "Static variable of a class";
}

class C2 {
  String augmented = "Instance variable of a class";
}

mixin M1 {
  static String augmented = "Static variable of a mixin";
}

mixin M2 {
  String augmented = "Instance variable of a mixin";
}

enum E {
  e1;
  static String augmented = "Static variable of an enum";
}

class A {}

extension Ext on A {
  static String augmented = "Static variable of an extension";
}

main() {
  print(C1);
  print(C2);
  print(M1);
  print(M2);
  print(E);
  print(A);
}

// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The exact result of an `augmented` expression depends on what is
/// being augmented, but it generally follows the same rules as any normal
/// identifier:
/// ...
/// - Augmenting fields: Within an augmenting field, augmented can only be used
///   in an initializer expression, and refers to the original field's
///   initializer expression, which is immediately evaluated.
///
/// If augmented refers to a variable declaration (as defined by a declaration
/// and a number of prior augmentations) with no initializer expression, and the
/// variable's type is nullable, augmented evaluates to null. If the variable's
/// type is not nullable, then it's a compile-time error.
///
/// @description Checks that it is a compile-time error if an augmenting
/// field initializer contains a function with a named parameter whose name is
/// `augmented`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmented_expression_A03_t26_lib.dart';

String foo({int augmented = 0}) => "${augmented + 42}";

String topLevelVariable = "Top-level variable";

class C {
  static String staticVariable = "Static variable of a class";
  String instanceVariable = "Instance variable of a class";
}

mixin M {
  static String staticVariable = "Static variable of a mixin";
  String instanceVariable = "Instance variable of a mixin";
}

enum E {
  e1;
  static String staticVariable = "Static variable of an enum";
}

class A {}

extension Ext on A {
  static String staticVariable = "Static variable of an extension";
}

main() {
  print(topLevelVariable);
  print(C);
  print(M);
  print(E);
  print(A);
}

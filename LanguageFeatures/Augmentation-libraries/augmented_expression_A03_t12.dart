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
/// @description Checks that it is a compile-time error to use `augmented` in an
/// augmenting field's initializer if the member being augmented is not a field
/// with an initializer and the variable's type is not-nullable. Test `late`
/// variables
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmented_expression_A03_t12_lib.dart';

final String augmented = "Augmented variable";

late String topLevelVariable;
late final String finalTopLevelVariable;

class C {
  static late String staticVariable;
  static late final String finalStaticVariable;
  late String instanceVariable;
  late final String finalInstanceVariable;
}

mixin M {
  static late String staticVariable;
  static late final String finalStaticVariable;
  late String instanceVariable;
  late final String finalInstanceVariable;
}

enum E {
  e1;
  static late String staticVariable;
  static late final String finalStaticVariable;
}

class A {}

extension Ext on A {
  static late String staticVariable;
  static late final String finalStaticVariable;
}

class MA = Object with M;

main() {
  print(topLevelVariable);
  print(finalTopLevelVariable);
  print(C);
  print(M);
  print(E);
  print(A);
}

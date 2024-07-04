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
/// It is a compile-time error to use augmented in an augmenting field's
/// initializer if the member being augmented is not a field with an initializer
///
/// @description Checks that it is a compile-time error to use `augmented` as a
/// constant value in a switch expressions and statements.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmented_expression_A03_t30_lib.dart';

const augmented = "Constant augmented, shouldn't be used";

String foo() => "Original";

var topLevelVariable = foo;
final finalTopLevelVariable = foo;

class C {
  static var staticVariable = foo;
  static final finalStaticVariable = foo;
  var instanceVariable = foo;
  final finalInstanceVariable = foo;
}

mixin M {
  static var staticVariable = foo;
  static final finalStaticVariable = foo;
  var instanceVariable = foo;
  final finalInstanceVariable = foo;
}

enum E {
  e1;

  static var staticVariable = foo;
  static final finalStaticVariable = foo;
  final finalInstanceVariable = foo;
}

class A {}

extension Ext on A {
  static var staticVariable = foo;
  static final finalStaticVariable = foo;
}

main() {
  print(topLevelVariable);
  print(finalTopLevelVariable);
  print(C);
  print(M);
  print(E);
  print(A);
}

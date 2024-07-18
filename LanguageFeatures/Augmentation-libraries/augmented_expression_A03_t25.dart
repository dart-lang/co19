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
/// @description Checks that it is not an error to use `augmented` in an
/// augmenting field's initializer if the member being augmented is a field
/// with an initializer.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmented_expression_A03_t25_lib1.dart';
import augment 'augmented_expression_A03_t25_lib2.dart';
import '../../Utils/expect.dart';

String? topLevelVariable = "Original";

class C {
  static String? staticVariable = "Original";
  String? instanceVariable = "Original";
}

mixin M {
  static String? staticVariable = "Original";
  String? instanceVariable = "Original";
}

enum E {
  e1;
  static String? staticVariable = "Original";
  final String? instanceVariable = "Original";
}

class A {}

extension Ext on A {
  static String? staticVariable = "Original";
}

class MA = Object with M;

main() {
  Expect.equals("Augment: Original", topLevelVariable);
  Expect.equals("Augment: Original", C.staticVariable);
  Expect.equals("Augment: Original", C().instanceVariable);
  Expect.equals("Augment: Original", M.staticVariable);
  Expect.equals("Augment: Original", MA().instanceVariable);
  Expect.equals("Augment: Original", E.staticVariable);
  Expect.equals("Augment: Original", E.e1.instanceVariable);
  Expect.equals("Augment: Original", Ext.staticVariable);
}

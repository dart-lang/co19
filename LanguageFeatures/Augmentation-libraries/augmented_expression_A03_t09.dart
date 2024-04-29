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
/// @description Checks that if an `augmented` is used in an augmenting field's
/// initializer and the member being augmented is a nullable field with no
/// initializer then `augmented` evaluates to `null`. Test `late` variables
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmented_expression_A03_t09_lib.dart';
import '../../Utils/expect.dart';

final String augmented = "Augmented variable";

late String? topLevelVariable;
late final String? finalTopLevelVariable;

class C {
  static late String? staticVariable;
  static late final String? finalStaticVariable;
  late String? instanceVariable;
  late final String? finalInstanceVariable;
}

mixin M {
  static late String? staticVariable;
  static late final String? finalStaticVariable;
  late String? instanceVariable;
  late final String? finalInstanceVariable;
}

enum E {
  e1;
  static late String? staticVariable;
  static late final String? finalStaticVariable;
}

class A {}

extension Ext on A {
  static late String? staticVariable;
  static late final String? finalStaticVariable;
}

class MA = Object with M;

main() {
  Expect.equals("Augment: null", topLevelVariable);
  Expect.equals("Augment: null", finalTopLevelVariable);
  Expect.equals("Augment: null", C.staticVariable);
  Expect.equals("Augment: null", C.finalStaticVariable);
  Expect.equals("Augment: null", C().instanceVariable);
  Expect.equals("Augment: null", C().finalInstanceVariable);
  Expect.equals("Augment: null", M.staticVariable);
  Expect.equals("Augment: null", M.finalStaticVariable);
  Expect.equals("Augment: null", MA().instanceVariable);
  Expect.equals("Augment: null", MA().finalInstanceVariable);
  Expect.equals("Augment: null", E.staticVariable);
  Expect.equals("Augment: null", E.finalStaticVariable);
  Expect.equals("Augment: null", Ext.staticVariable);
  Expect.equals("Augment: null", Ext.finalStaticVariable);
}

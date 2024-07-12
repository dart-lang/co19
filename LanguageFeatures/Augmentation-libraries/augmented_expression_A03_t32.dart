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
/// It is a compile-time error to use `augmented` in an augmenting field's
/// initializer if the member being augmented is not a field with an initializer
///
/// @description Checks that it is not an error to use `augmented` in an
/// augmenting field's initializer if the member being augmented is a field
/// with an initializer. Test late variables.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmented_expression_A03_t32_lib1.dart';
import '../../Utils/expect.dart';

late String? topLevelVariable = "Original";

class C {
  static late String? staticVariable = "Original";
  late String? instanceVariable = "Original";
}

mixin M {
  static late String? staticVariable = "Original";
  late String? instanceVariable = "Original";
}

enum E {
  e1;
  static late String? staticVariable = "Original";
}

class A {}

extension Ext on A {
  static late String? staticVariable = "Original";
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

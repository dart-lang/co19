// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The exact result of an `augmented` expression depends on what is
/// being augmented, but it generally follows the same rules as any normal
/// identifier:
/// - Augmenting getters: Within an augmenting getter `augmented` invokes the
///   getter and evaluates to the return value. If augmenting a field with a
///   getter, this will invoke the implicit getter from the augmented field.
///
/// @description Checks that it is a compile-time error to if an augmenting
/// getter has return type with the name `augmented`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmented_expression_A01_t18_lib.dart';

class augmented {}

augmented? get topLevelGetter => null;

class C {
  static augmented? get staticGetter => null;
  augmented? get instanceGetter => null;
}

mixin M {
  static augmented? get staticGetter => null;
  augmented? get instanceGetter => null;
}

enum E {
  e1;

  static augmented? get staticGetter => null;
  augmented? get instanceGetter => null;
}

class A {}

extension Ext on A {
  static augmented? get staticGetter => null;
  augmented? get instanceGetter => null;
}

main() {
  print(topLevelGetter);
  print(C);
  print(M);
  print(E);
  print(A);
}

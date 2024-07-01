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
/// @description Checks that it is a compile-time error to use a record which
/// has a field with the name `augmented` in a body of an augmenting getter.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmented_expression_A01_t22_lib.dart';

String get topLevelGetter => "Original";

class C {
  static String get staticGetter => "Original";
  String get instanceGetter => "Original";
}

mixin M {
  static String get staticGetter => "Original";
  String get instanceGetter => "Original";
}

enum E {
  e1;

  static String get staticGetter => "Original";
  String get instanceGetter => "Original";
}

class A {}

extension Ext on A {
  static String get staticGetter => "Original";
  String get instanceGetter => "Original";
}

main() {
  print(topLevelGetter);
  print(C);
  print(M);
  print(E);
  print(A);
}

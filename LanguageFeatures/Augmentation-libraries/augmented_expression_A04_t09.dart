// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The exact result of an `augmented` expression depends on what is
/// being augmented, but it generally follows the same rules as any normal
/// identifier:
/// ...
/// - Augmenting functions: When augmenting a function, augmented refers to the
///   augmented function. Tear offs are not allowed, so this function must
///   immediately be invoked.
///
/// @description Checks that it is a compile-time error to declare a local
/// function named `augmented` inside of an augmenting function. Test an object
/// pattern.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmented_expression_A04_t09_lib.dart';

void topLevelFunction() {}

class C {
  static void staticMethod() {}
  void instanceMethod() {}
}

mixin M {
  static void staticMethod() {}
  void instanceMethod() {}
}

enum E {
  e1;

  static void staticMethod() {}
  void instanceMethod() {}
}

class A {}

extension Ext on A {
  static void staticMethod() {}
  void instanceMethod() {}
}

main() {
  print(topLevelFunction);
  print(C);
  print(M);
  print(E);
  print(A);
}

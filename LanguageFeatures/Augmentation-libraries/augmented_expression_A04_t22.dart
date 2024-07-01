// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The exact result of an `augmented` expression depends on what is
/// being augmented, but it generally follows the same rules as any normal
/// identifier:
/// ...
/// - Augmenting functions: When augmenting a function, `augmented` refers to
///   the augmented function. Tear offs are not allowed, so this function must
///   immediately be invoked.
///
/// @description Checks that it is a compile-time error to augment a function
/// whose name is `augmented`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmented_expression_A04_t22_lib.dart';

void augmented() {}

class C1 {
  static void augmented() {}
}

class C2 {
  void augmented() {}
}

mixin M1 {
  static void augmented() {}
}

mixin M2 {
  void augmented() {}
}

enum E1 {
  e1;

  static void augmented() {}
}

enum E2 {
  e1;

  void augmented() {}
}

class A {}

extension Ext1 on A {
  static void augmented() {}
}

extension Ext2 on A {
  void augmented() {}
}

main() {
  print(augmented);
  print(C1);
  print(C2);
  print(M1);
  print(M2);
  print(E1);
  print(E2);
  print(A);
}

// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The exact result of an `augmented` expression depends on what is
/// being augmented, but it generally follows the same rules as any normal
/// identifier:
/// ...
/// - Augmenting enum values: When augmenting an enum value, `augmented` has no
///   meaning and is not allowed.
///
/// @description Checks that it is a compile-time error for augmentation to add
/// an enum value that passes `augmented` as an actual argument of a constructor
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmented_expression_A06_t04_lib.dart';

enum E0 {
  e0,
  augmented;
}

const augmented = 42;

enum E1 {
  e0,
  e1.required(0),
  e2.named(y: 0),
  e3.fromE0(E0.e0);

  const E1();
  const E1.required(int x);
  const E1.named({int y = 0});
  const E1.fromE0(E0 e);
}

main() {
  print(E1);
}

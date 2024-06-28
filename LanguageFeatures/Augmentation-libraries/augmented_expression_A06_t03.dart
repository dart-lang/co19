// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The exact result of an `augmented` expression depends on what is
/// being augmented, but it generally follows the same rules as any normal
/// identifier:
/// ...
/// - Augmenting enum values: When augmenting an enum value, augmented has no
///   meaning and is not allowed.
///
/// @description Checks that it is a compile-time error to augment an enum value
/// with has a constructor with a parameter named `augmented`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmented_expression_A06_t03_lib.dart';

enum E {
  e1.named(augmented: 1),
  e2.namedRequired(augmented: 2),
  e3.record((augmented: 3));

  const E.named({int augmented = 0});
  const E.namedRequired({required int augmented});
  const E.record(({int augmented}) r);
}

main() {
  print(E);
}

// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion When augmenting an enum value, no constructor invocation should
/// be provided. The original value is always used, and the explicit constructor
/// invocation (if present) should not be copied.
///
/// @description Checks that it is a compile-time error to augment an enum value
/// by the constructor invocation.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmenting_enum_values_A02_t02_lib.dart';

enum E {
  e0(1),
  e1.foo();

  const E(int i);
  const E.foo();
}

augment enum E {
  e2.foo();
}

main() {
  print(E);
}

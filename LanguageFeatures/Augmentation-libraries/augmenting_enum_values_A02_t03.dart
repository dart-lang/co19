// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion When augmenting an enum value, no constructor invocation should
/// be provided. The original value is always used, and the explicit constructor
/// invocation (if present) should not be copied.
///
/// @description Checks that when augmentation of enum value omits constructor
/// invocation then the original value is used.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmenting_enum_values_A02_t03_lib.dart';
import '../../Utils/expect.dart';

enum E {
  e0(0),
  e1.foo(x: 10),
  e2.bar(20);

  final int x;
  const E(this.x);
  const E.foo({this.x = 1});
  const E.bar([this.x = 2]);
}

main() {
  Expect.equals(0, E.e0.x);
  Expect.equals(10, E.e1.x);
  Expect.equals(20, E.e2.x);
}

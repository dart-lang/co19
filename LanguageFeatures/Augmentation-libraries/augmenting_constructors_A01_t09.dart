// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// - The signature of the constructor augmentation does not match the original
///   constructor. It must have the same number of positional parameters, the
///   same named parameters, and matching parameters must have the same type,
///   optionality, and any required modifiers must match. Any initializing
///   formals and super parameters must also be the same in both constructors.
///
/// @description Checks that it is not an error if a constructor augmentation
/// reorders named parameters of the original constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmenting_constructors_A01_t09_lib.dart';
import '../../Utils/expect.dart';

class C {
  int x, y;
  C({this.x = 0, this.y = 0});
}

enum E {
  e0(x: 1, y: 2);
  final int x, y;
  const E({this.x = 0, this.y = 0});
}

extension type ET(int x) {
  ET.foo({this.x = 0, int y = 0});
}

main() {
  Expect.equals(1, C(x: 1, y: 2).x);
  Expect.equals(2, C(y: 2).y);
  Expect.equals(1, E.e0.x);
  Expect.equals(2, E.e0.y);
  Expect.equals(1, ET.foo(x: 1));
}

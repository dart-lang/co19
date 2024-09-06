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
/// replaces type of formal parameter by `var`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import '../../Utils/expect.dart';
part 'augmenting_constructors_A01_t11_lib.dart';

String _log = "";

class C {
  var x, y;
  C(int this.x, [int this.y = 0]);
  C.foo({required int this.x, int this.y = 0});
  C.bar(int x, [int y = 0]): x = x, y = y;
  C.baz({required int x, int y = 0}): x = x, y = y;
}

enum E {
  e0(1), e1.foo(x: 1), e2.bar(1), e3.baz(x: 1);
  final x, y;
  const E(int this.x, [int this.y = 0]);
  const E.foo({required int this.x, int this.y = 0});
  const E.bar(int x, [int y = 0]): x = x, y = y;
  const E.baz({required int x, int y = 0}): x = x, y = y;
}

extension type ET(int x) {
  ET.foo(int this.x);
  ET.bar({required int this.x});
  ET.baz(int x, [int y = 0]): x = x;
  ET.qux({required int x, int y = 0}): x = x;
}

main() {
  Expect.equals(1, C(1).x);
  Expect.equals(0, C(1).y);
  Expect.equals("Augmented: 1, 0", _log);
  Expect.equals(1, C.foo(x: 1).x);
  Expect.equals(0, C.foo(x: 1).y);
  Expect.equals("Augmented: 1, 0", _log);
  Expect.equals(1, C.bar(1).x);
  Expect.equals(0, C.bar(1).y);
  Expect.equals("Augmented: 1, 0", _log);
  Expect.equals(1, C.baz(x: 1).x);
  Expect.equals(0, C.baz(x: 1).y);
  Expect.equals("Augmented: 1, 0", _log);

  Expect.equals(1, E.e0.x);
  Expect.equals(0, E.e0.y);
  Expect.equals(1, E.e1.x);
  Expect.equals(0, E.e1.y);
  Expect.equals(1, E.e2.x);
  Expect.equals(0, E.e2.y);
  Expect.equals(1, E.e3.x);
  Expect.equals(0, E.e3.y);

  Expect.equals(1, ET.foo(1).x);
  Expect.equals("Augmented: 1, 0", _log);
  Expect.equals(1, ET.bar(x: 1).x);
  Expect.equals("Augmented: 1, 0", _log);
  Expect.equals(1, ET.baz(1));
  Expect.equals("Augmented: 1, 0", _log);
}

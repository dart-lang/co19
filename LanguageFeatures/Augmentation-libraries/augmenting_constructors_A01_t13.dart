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
/// @description Checks that it is not an error if an introductory constructor
/// parameters implicitly have type `dynamic` and the augmenting constructor
/// specifies it explicitly.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import '../../Utils/expect.dart';
part 'augmenting_constructors_A01_t13_lib.dart';

String _log = "";

class C {
  var x, y;
  C(this.x, [this.y]);
  C.foo({required this.x, this.y});
  C.bar(x, [y]): x = x, y = y;
  C.baz({required x, y}): x = x, y = y;
}

enum E {
  e0(1), e1.foo(x: 1), e2.bar(1), e3.baz(x: 1);
  final x, y;
  const E(this.x, [this.y]);
  const E.foo({required this.x, this.y});
  const E.bar(x, [y]): x = x, y = y;
  const E.baz({required x, y}): x = x, y = y;
}

extension type ET(int x) {
  ET.foo(this.x, y);
  ET.bar(this.x, [y]);
  ET.baz(this.x, {y});
  ET.qux(this.x, {required y});
}

main() {
  Expect.equals(1, C(1).x);
  Expect.equals(null, C(1).y);
  Expect.equals("Augmented: 1, null", _log);
  Expect.equals(1, C.foo(x: 1).x);
  Expect.equals(null, C.foo(x: 1).y);
  Expect.equals("Augmented: 1, null", _log);
  Expect.equals(1, C.bar(1).x);
  Expect.equals(null, C.bar(1).y);
  Expect.equals("Augmented: 1, null", _log);
  Expect.equals(1, C.baz(x: 1).x);
  Expect.equals(null, C.baz(x: 1).y);
  Expect.equals("Augmented: 1, null", _log);

  Expect.equals(1, E.e0.x);
  Expect.equals(null, E.e0.y);
  Expect.equals(1, E.e1.x);
  Expect.equals(null, E.e1.y);
  Expect.equals(1, E.e2.x);
  Expect.equals(null, E.e2.y);
  Expect.equals(1, E.e3.x);
  Expect.equals(null, E.e3.y);

  ET.foo(1, 1);
  Expect.equals("Augmented: 1, 1", _log);
  ET.bar(1);
  Expect.equals("Augmented: 1, null", _log);
  ET.baz(1);
  Expect.equals("Augmented: 1, null", _log);
  ET.qux(1, y: "42");
  Expect.equals("Augmented: 1, 42", _log);
}

// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An incomplete constructor can be completed by adding an
/// initializer list and/or a body, or by adding a redirection.
///
/// @description Checks that a constructor with initializing formals can be
/// augmented by an incomplete declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

class C {
  int x;
  C(this.x);
  C.foo([this.x]);
  C.bar({this.x});
  C.baz({required this.x});
}

augment class C {
  augment C(int x);
  augment C.foo([int x = 1]);
  augment C.bar({int x = 2});
  augment C.baz({required int x});
}

enum E {
  e0(0), e1.foo(), e2.foo(2), e3.bar(), e4.bar(x: 3), e5.baz(x: 4);
  final int x;
  const E(this.x);
  const E.foo([this.x]);
  const E.bar({this.x});
  const E.baz({required this.x});
}

augment enum E {
  augment const E(int x);
  augment const E.foo([int x = 1]);
  augment const E.bar({int x = 2});
  augment const E.baz({required int x});
}

extension type ET._(int x) {
  ET(this.x);
  ET.foo([this.x]);
  ET.bar({this.x});
  ET.baz({required this.x});
}

augment extension type ET {
  augment ET(int x);
  augment ET.foo([int x = 1]);
  augment ET.bar({int x = 2});
  augment ET.baz({required int x});
}

main() {
  Expect.equals(0, C(0).x);
  Expect.equals(1, C.foo().x);
  Expect.equals(2, C.foo(2).x);
  Expect.equals(2, C.bar().x);
  Expect.equals(3, C.bar(x: 3).x);
  Expect.equals(4, C.baz(x: 4).x);

  Expect.equals(0, E.e0.x);
  Expect.equals(1, E.e1.x);
  Expect.equals(2, E.e2.x);
  Expect.equals(2, E.e3.x);
  Expect.equals(3, E.e4.x);
  Expect.equals(4, E.e5.x);

  Expect.equals(0, ET(0).x);
  Expect.equals(1, ET.foo().x);
  Expect.equals(2, ET.foo(2).x);
  Expect.equals(2, ET.bar().x);
  Expect.equals(3, ET.bar(x: 3).x);
  Expect.equals(4, ET.baz(x: 4).x);
}

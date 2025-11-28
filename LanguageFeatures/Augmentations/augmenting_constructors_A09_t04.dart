// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An incomplete constructor can be completed by adding an
/// initializer list and/or a body, or by adding a redirection.
///
/// @description Checks that an incomplete constructor can be completed by the
/// augmenting constructor with the initializing formals.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

class C {
  int x;
  C(int x);
  C.foo([int x]);
  C.bar({int x});
  C.baz({required int x});
}

augment class C {
  augment C(this.x);
  augment C.foo([this.x = 1]);
  augment C.bar({this.x = 2});
  augment C.baz({required this.x});
}

enum E {
  e0(0), e1.foo(), e2.foo(2), e3.bar(), e4.bar(x: 3), e5.baz(x: 4);
  final int x;
  const E(int x);
  const E.foo([int x]);
  const E.bar({int x});
  const E.baz({required int x});
}

augment enum E {
  augment const E(this.x);
  augment const E.foo([this.x = 1]);
  augment const E.bar({this.x = 2});
  augment const E.baz({required this.x});
}

extension type ET {
  ET(int x);
  ET.foo([int x = 1]);
  ET.bar({int x = 2});
  ET.baz({required int x});
}

augment extension type ET._(int x) {
  augment ET(this.x);
  augment ET.foo([this.x]);
  augment ET.bar({this.x});
  augment ET.baz({required this.x});
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

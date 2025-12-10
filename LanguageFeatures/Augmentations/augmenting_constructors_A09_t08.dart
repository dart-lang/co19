// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An incomplete constructor can be completed by adding an
/// initializer list and/or a body, or by adding a redirection.
///
/// @description Checks that a redirecting factory constructor marked `augment`
/// adds its factory redirection to the augmented constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

class C {
  int x, y;
  C(this.x, [this.y = 0]);
  C.foo(this.x, {this.y = 0});
  factory C.bar(int x, [int y]);
  factory C.baz(int x, {int y});
  factory C.qux(int x, [int y]);
}

class D extends C {
  D(super.x, [super.y = 0]);
}

augment class C {
  augment factory C.bar(int x, [int y]) = C;
  augment factory C.baz(int x, {int y}) = C.foo;
  augment factory C.qux(int x, [int y]) = D;
}

extension type ET(int x) {
  ET.foo(this.x);
  factory ET.bar(int x);
  factory ET.baz(int x);
}

augment extension type ET {
  augment factory ET.bar(int x) = ET;
  augment factory ET.baz(int x) = ET.foo;
}

main() {
  Expect.equals(1, C.bar(1).x);
  Expect.equals(0, C.bar(1).y);
  Expect.equals(1, C.bar(1, 2).x);
  Expect.equals(2, C.bar(1, 2).y);

  Expect.equals(1, C.baz(1).x);
  Expect.equals(0, C.baz(1).y);
  Expect.equals(1, C.baz(1, y: 2).x);
  Expect.equals(2, C.baz(1, y: 2).y);

  Expect.equals(1, C.qux(1).x);
  Expect.equals(0, C.qux(1).y);
  Expect.equals(1, C.qux(1, 2).x);
  Expect.equals(2, C.qux(1, 2).y);

  Expect.equals(1, ET.bar(1).x);
  Expect.equals(2, ET.baz(2).x);
}

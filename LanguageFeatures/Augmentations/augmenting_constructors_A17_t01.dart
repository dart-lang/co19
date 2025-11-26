// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An incomplete constructor can be completed by adding an
/// initializer list and/or a body, or by adding a redirection.
///
/// @description Checks that an augmenting redirecting generative constructor
/// may add redirecting initializer to the augmented constructors initializer
/// list.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

class C {
  int x, y;
  C(this.x, [this.y = 0]);
  C.foo(int x, {int y = 0});
  C.bar(int x, {required int y});
}

augment class C {
  augment C.foo(int x, {int y}) : this(x, y);
  augment C.bar(int x, {required int y}) : this.foo(x, y: y);
}

enum E {
  e0.foo(1), e1.foo(2, y: 3), e2.bar(4, y: 5);
  final int x, y;
  const E(this.x, [this.y = 0]);
  const E.foo(int x, {int y = 0});
  const E.bar(int x, {required int y});
}

augment enum E {
  augment const E.foo(int x, {int y}) : this(x, y);
  augment const E.bar(int x, {required int y}) : this.foo(x, y: y);
}

extension type ET._(int x) {
  ET(int x);
  ET.foo([int x = 0]);
  ET.bar({required int x});
}

augment extension type ET {
  augment ET(int x) : this._(x);
  augment ET.foo([int x]) : this(x);
  augment ET.bar({required int x}) : this.foo(x);
}

main() {
  Expect.equals(1, C.foo(1).x);
  Expect.equals(0, C.foo(1).y);
  Expect.equals(1, C.foo(1, y: 2).x);
  Expect.equals(2, C.foo(1, y: 2).y);
  Expect.equals(1, C.bar(1, y: 2).x);
  Expect.equals(2, C.bar(1, y: 2).y);

  Expect.equals(1, E.e0.x);
  Expect.equals(0, E.e0.y);
  Expect.equals(2, E.e1.x);
  Expect.equals(3, E.e1.y);
  Expect.equals(4, E.e2.x);
  Expect.equals(5, E.e2.y);

  Expect.equals(1, ET(1).x);
  Expect.equals(0, ET.foo().x);
  Expect.equals(2, ET.foo(2).x);
  Expect.equals(3, ET.bar(x: 3).x);
}

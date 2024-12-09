// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A redirecting generative constructor marked `augment` adds its
/// redirection to the augmented constructor.
///
/// This converts it into a redirecting generative constructor, removing the
/// potentially non-redirecting property of the constructor.
///
/// @description Checks that an augmenting redirecting generative constructor
/// may add redirecting initializer to the augmented constructors initializer
/// list.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import '../../Utils/expect.dart';
part 'augmenting_constructors_A17_t01_lib.dart';

class C {
  int x, y;
  C(this.x, [this.y = 0]);
  C.foo(int x, {int y = 0});
  C.bar(int x, {required int y});
}

enum E {
  e0(0), e1.foo(1, y: 2), e2.bar(3, y: 4);
  final int x, y;
  const E(this.x, [this.y = 0]);
  const E.foo(int x, {int y = 0});
  const E.bar(int x, {required int y});
}

int log = -1;

extension type ET(int x) {
  ET.foo(int x, int y) {
    log = y;
  }
  ET.bar(int x, [int y = 0]);
  ET.baz(int x, {int y = 0});
  ET.qux(int x, {required int y});
}

main() {
  Expect.equals(1, C.foo(1).x);
  Expect.equals(0, C.foo(1).y);
  Expect.equals(1, C.foo(1, y: 2).x);
  Expect.equals(2, C.foo(1, y: 2).y);
  Expect.equals(1, C.bar(1, y: 2).x);
  Expect.equals(2, C.bar(1, y: 2).y);

  Expect.equals(1, E.e1.x);
  Expect.equals(2, E.e1.y);
  Expect.equals(3, E.e2.x);
  Expect.equals(4, E.e2.y);

  Expect.equals(2, ET.foo(1, 2).x);
  Expect.equals(1, log);
  Expect.equals(3, ET.bar(3, 4).x);
  Expect.equals(4, log);
  Expect.equals(5, ET.baz(5, y: 6).x);
  Expect.equals(6, log);
  Expect.equals(7, ET.qux(7, y: 8).x);
  Expect.equals(8, log);
}

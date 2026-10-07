// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - A constructor is not complete after all augmentations are applied, unless
///   it's a generative constructor.
///
/// @description Checks that it is not an error if a generative constructor is
/// incomplete after all augmentations are applied.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class C {
  C();
  C.c1();
  C.c2([int x]);
  C.c3({int x = 0});

  augment C();
  augment C.c1();
  augment C.c2([int x = 0]);
  augment C.c3({int x});
}

augment class C {
  augment C();
  augment C.c1();
  augment C.c2([int x]);
  augment C.c3({int x});
}

enum E {
  e0, e1.c1(), e2.c2(1), e3(x: 3);
  E();
  E.c1();
  E.c2([int x]);
  E.c3({int x});

  augment E();
  augment E.c1();
  augment E.c2([int x = 0]);
  augment E.c3({int x});
}

augment enum E {
  ;
  augment factory E.f1();
  augment factory E.f2([int x]);
  augment factory E.f3({int x = 0});
}

main() {
  C();
  C.c1();
  C.c2();
  C.c3();
  print(E);
}

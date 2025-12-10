// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An incomplete constructor can be completed by adding an
/// initializer list and/or a body, or by adding a redirection.
///
/// @description Checks that an incomplete constructor can be completed by
/// adding `external` modifier.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class C {
  int x, y;
  C(int x, [int y]);
  C.foo(int x, {int y});
  C.bar(int x, {required int y});
}

augment class C {
  augment external C(int x, [int y = 0]);
  augment external C.foo(int x, {int y});
  augment external C.bar(int x, {required int y});
}

enum E {
  e0;
  final int x, y;
  const E(this.x, this.y);
  const E.foo(int x, [int y]);
  const E.bar(int x, {int y = 0});
  const E.baz(int x, {required int y});
}

augment enum E {
  ;
  augment external const E.foo(int x, [int y = 0]);
  augment external const E.bar(int x, {int y});
  augment external const E.baz(int x, {required int y});
}

extension type ET._(int x) {
  ET(int x);
  ET.foo([int x = 0]);
  ET.bar({required int x});
}

augment extension type ET {
  augment external ET(int x);
  augment external ET.foo([int x]);
  augment external ET.bar({required int x});
}

main() {
  print(C);
  print(E);
  print(ET);
}

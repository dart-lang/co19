// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - The augmenting constructor parameters specify any default values.
///
/// @description Checks that it is a compile-time error if the augmenting
/// constructor parameters specify any default values.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmenting_constructors_A02_t01_lib.dart';

class C {
  C([int x = 0]);
  C.c1({int x = 0});
  factory C.c2([int x = 0]) => C(x);
  factory C.c3({int x = 0}) => C.c1(x: x);
}

enum E {
  e0(0);
  const E([int x = 0]);
  const E.c1({int x = 0});
  factory E.c2([int x = 0]) => E.e0;
  factory E.c3({int x = 0}) => E.e0;
}

extension type ET(int id) {
  ET.c1(this.id, [int x = 0]);
  ET.c2(this.id, {int x = 0});
  factory ET.c3(int id, [int x = 0]) => ET.c1(id, x);
  factory ET.c4(int id, {int x = 0}) => ET.c2(id, x: x);
}

main() {
  print(C);
  print(E);
  print(ET);
}

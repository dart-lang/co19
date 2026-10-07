// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - No declaration in the augmentation chain specifies a default value for an
///   optional parameter whose declared type is potentially non-nullable, unless
///   the constructor (after augmentations are applied) is a redirecting factory
///   constructor.
///
/// @description Checks that it is not an error if no declaration in the
/// augmentation chain specifies a default value for an optional parameter whose
/// declared type is potentially non-nullable, and the constructor is a
/// redirecting factory.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

class C {
  final int x;
  C([this.x = 0]);
  C.named({this.x = 0});
  factory C.f1([int x]);
  factory C.f2({int x});

  augment factory C.f1([int x]);
  augment factory C.f2({int x});
}

augment class C {
  augment factory C.f1([int x]) = C;
  augment factory C.f2({int x}) = C.named;
}

enum E {
  e0,
  e1;

  factory E.f1([int x = 0]) => x == 0 ? E.e0 : E.e1;
  factory E.f2({int x = 0}) => x == 0 ? E.e0 : E.e1;
  factory E.f3([int x]);
  factory E.f4({int x});

  augment factory E.f3([int x]);
  augment factory E.f4({int x});
}

augment enum E {
  ;
  augment factory E.f3([int x]) = E.f1;
  augment factory E.f4({int x}) = E.f2;
}

extension type ET(int x) {
  ET.g1([this.x = 0]);
  ET.g2({this.x = 0});
  factory ET.f1([int x]);
  factory ET.f2({int x});

  augment factory ET.f1([int x]);
  augment factory ET.f2({int x});
}

augment extension type ET {
  augment factory ET.f1([int x]) = ET.g1;
  augment factory ET.f2({int x}) = ET.g2;
}

main() {
  Expect.equals(0, C.f1().x);
  Expect.equals(1, C.f1(1).x);
  Expect.equals(0, C.f2().x);
  Expect.equals(2, C.f2(x: 2).x);

  Expect.equals(E.e0, E.f1());
  Expect.equals(E.e1, E.f1(1));
  Expect.equals(E.e0, E.f2());
  Expect.equals(E.e1, E.f2(x: 1));

  Expect.equals(0, ET.f1().x);
  Expect.equals(1, ET.f1(1).x);
  Expect.equals(0, ET.f2().x);
  Expect.equals(2, ET.f2(x: 2).x);
}

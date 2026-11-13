// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that an augmenting function or constructor's signature
/// matches an introductory signature if:
/// - The two declarations have the same type parameters.
/// - The return type is the same as the introductory declaration's return type.
/// - It has the same number of positional parameters as the introductory
///   declaration, and the same number of those are optional.
/// - It has the same set of named parameter names as the introductory
///   declaration.
/// - For each corresponding pair of parameters:
///   - They have the same name. This is trivial for named parameters, but may
///     fail to hold for positional parameters.
///   - They have the same type.
///   - They both have the modifier `covariant`, or none of them have it.
///   - They both have the modifier `required`, or none of them have it.
/// ...
/// It is a compile-time error if:
/// - The signature of an augmenting constructor does not match the signature of
///   the corresponding introductory declaration.
///
/// @description Checks that it is not an error if a constructor augmentation
/// reorders named parameters of the original constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

class C {
  int x, y;
  C({this.x = 0, this.y = 0});
}

augment class C {
  augment C({int y, int x});
}

enum E {
  e0(x: 1, y: 2);
  final int x, y;
  const E({this.x = 0, this.y = 0});
}

augment enum E {
  ;
  augment const E({int y, int x});
}

extension type ET(int x) {
  ET.foo({this.x = 0, int y = 0});
}

augment extension type ET {
  augment ET.foo({int y, int x});
}

main() {
  Expect.equals(1, C(x: 1, y: 2).x);
  Expect.equals(2, C(y: 2).y);
  Expect.equals(1, E.e0.x);
  Expect.equals(2, E.e0.y);
  Expect.equals(1, ET.foo(x: 1));
}

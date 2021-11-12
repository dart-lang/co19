// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It’s a compile-time error if a super-parameter has a type which
/// is not a subtype of the type of its associated super-constructor parameter.
///
/// @description Check that it’s a compile-time error if a super-parameter has a
/// type which is not a subtype of the type of its associated super-constructor
/// parameter.
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=super-parameters

class S {
  int s1;
  int s2;
  S(this.s1, [this.s2 = 0]);
}

class C extends S {
  int c1;
  C(this.c1, int super.s1, num x, num super.s2);
//                                ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  C(1, 42, 3.14, 42);
}

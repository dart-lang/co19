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

abstract class S {
  int s1;
  int s2;
  S(this.s1, this.s2);
}

class C extends S {
  num c1;
  C(this.c1, [super.s1 = 3.14, num x, super.s2 = 0]);
//                       ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  C(42.1);
}

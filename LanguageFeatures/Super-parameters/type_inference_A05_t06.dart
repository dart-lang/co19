// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We also copy the default value of the associated
/// super-constructor if applicable:
///
/// If p is optional, does not declare a default value, the associated
/// super-constructor parameter is also optional and has a default value d, and
/// d is a subtype of the (declared or inferred above) type of p, then p gets
/// the default value d.
///
/// @description Check that id `d` is not subtype of the declared type of p
/// @author sgrekhov@unipro.ru

class S {
  int s1;
  int s2;
  S([this.s1 = 1, this.s2 = 2]);
}

class C extends S {
  int c1;
  C(this.c1, [num super.s1, int x, num super.s2]);
//            ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  C(42);
}

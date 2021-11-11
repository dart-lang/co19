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
/// @description Check that if p is optional, does not declare a default value,
/// the associated super-constructor parameter is also optional and has a
/// default value d, and d is a subtype of the (declared or inferred above) type
/// of p, then p gets the default value d
/// @author sgrekhov@unipro.ru

import "../../Utils/expect.dart";

class S {
  int s1;
  int s2;
  S([this.s1 = 1, this.s2 = 2]);
}

class C extends S {
  int c1;
  C(this.c1, [num super.s1, int x, num super.s2]);
}

main() {
  C c1 = C(42);
  Expect.equals(1, c1.s1);
  Expect.equals(2, c1.s2);

  C c2 = C(0, 42);
  Expect.equals(42, c2.s1);
  Expect.equals(2, c2.s2);

  C c3 = C(0, 42, 43, 44);
  Expect.equals(42, c3.s1);
  Expect.equals(44, c3.s2);
}

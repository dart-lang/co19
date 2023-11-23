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
  int s;
  S({int x = 0}) : s = x - 1;
}

class C extends S {
  int c;
  C({super.x}) : c = x + 1;
}

main() {
  Expect.equals(1, C().c);
  Expect.equals(43, C(x: 42).c);
}

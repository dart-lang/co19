// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Test equality of function and methods tearoffs.
/// https://github.com/dart-lang/language/issues/1712
///
/// @description Checks equality of instantiated generic instance methods
/// tearoffs
/// @author sgrekhov@unipro.ru

import "../../Utils/expect.dart";

class C {
  X foo1<X>(X x) => x;
  X foo2<X>(X x) => x;
}

main() {
  C c1 = new C();
  C c2 = new C();
  var v1_1_1 = c1.foo1<int>;
  var v1_1_2 = c1.foo1<int>;
  var v1_2 = c1.foo2<int>;
  var v2_1_1 = c2.foo1<int>;
  var v2_2 = c2.foo2<int>;

  Expect.equals(v1_1_1, v1_1_2);
  Expect.notEquals(v1_1_1, v1_2);
  Expect.notEquals(v2_1_1, v1_1_1);
  Expect.notEquals(v1_2, v2_2);
}

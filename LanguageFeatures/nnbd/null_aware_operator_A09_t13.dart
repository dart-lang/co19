// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The assignment e1?.f = e2 translates to:
///  SHORT[EXP(e1), fn[x] => x.f = EXP(e2)]
///
///  The other assignment operators are handled equivalently.
///
/// @description Check that assignments like e1?.f ??= e2 translates to:
///  SHORT[EXP(e1), fn[x] => x.f ??= EXP(e2)]
/// @author sgrekhov@unipro.ru

import "../../Utils/expect.dart";

class C {
  int? test = 13;
}

void testShort(C? x, int e2) {
  var actual1 = x?.test ??= e2;
  var n0 = x;
  var expected1 = n0 == null ? null : n0.test ??= e2;
  Expect.equals(expected1, actual1);
}

main() {
  C? c1 = null;
  testShort(c1, 42);
  c1 = new C();
  testShort(c1, 42);
  if (c1 != null) {
    c1.test = null;
    testShort(c1, 42);
  }

  C c2 = new C();
  testShort(c2, 42);
  c2.test = null;
  testShort(c2, 42);
}

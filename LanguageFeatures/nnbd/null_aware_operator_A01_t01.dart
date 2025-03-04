// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A property access e?.f translates to:
///  SHORT[EXP(e), fn[x] => x.f]
///
/// @description Check that a property access e?.f translates to:
///  SHORT[EXP(e), fn[x] => x.f]
/// @author sgrekhov@unipro.ru

import "../../Utils/expect.dart";

class C {
  String test1 = "Lily was here";
  String get test2 => "Show must go on";
}

void testShort(C? x) {
  var actual = x?.test1;
  var n0 = x;
  var expected = n0 == null ? null : n0.test1;
  Expect.equals(expected, actual);

  var actual2 = x?.test2;
  var expected2 = n0 == null ? null : n0.test2;
  Expect.equals(expected2, actual2);
}

main() {
  C? c1 = null;
  testShort(c1);
  c1 = new C();
  testShort(c1);

  C c2 = new C();
  testShort(c2);
}

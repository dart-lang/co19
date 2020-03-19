/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The grammar of selectors is extended to allow null-aware
 * subscripting using the syntax e1?[e2] which evaluates to null if e1
 * evaluates to null and otherwise evaluates as e1[e2].
 *
 * @description Check that the grammar of selectors is extended to allow
 * null-aware subscripting using the syntax e1?[e2] which evaluates to null if
 * e1 evaluates to null and otherwise evaluates as e1[e2]. Test type aliases
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable,nonfunction-type-aliases
// Requirements=nnbd-strong
import "../../../Utils/expect.dart";

class C {
  int operator[](int index) => index * 2;
}

typedef CAlias = C?;

main() {
  CAlias c = null;
  Expect.isNull(c?[42]);
  c = new C();
  Expect.equals(4, c?[2]);
}

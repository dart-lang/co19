/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A check of the form [e != null] or of the form [e is T] where [e]
 * has static type [T?] promotes the type of [e] to [T] in the [true]
 * continuation, and to [Null] in the [false] continuation.
 *
 * @description Check that type of [e] is promoted to [Null] in the [false]
 * condition.
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable,nonfunction-type-aliases

import "../../Utils/expect.dart";

class A {}
class B<T> {}

typedef AA = A;
typedef AAA = A?;

void checkme(var x, var expectedType) {
  Expect.isFalse(x != null);
  Expect.isFalse(x is expectedType);
}

main() {
  Expect.isFalse(null != null);

  A ? a = null;
  checkme(a, A);

  B? b1 = null;
  checkme(b1, B);

  B<int> ? b2 = null;
  checkme(b2, B);

  dynamic ? d = null;
  checkme(d, dynamic);

  Object ? o = null;
  checkme(o, Object);

  AA ? aa = null;
  checkme(aa, AA);
  checkme(aa, A);

  AAA aaa = null;
  checkme(aaa, AAA);
  checkme(aaa, A);
}

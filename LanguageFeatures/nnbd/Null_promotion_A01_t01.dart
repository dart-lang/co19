/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A check of the form [e == null] or of the form [e is Null] where
 * [e] has static type [T] promotes the type of [e] to [Null] in the [true]
 * continuation, and to [NonNull(T)] in the [false] continuation.
 *
 * @description Check that [e] is promoted to [Null] in the [true] condition.
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable,nonfunction-type-aliases

import "../../Utils/expect.dart";

class A {}
class B<T> {}

typedef AA = A;
typedef AAA = A?;

void checkme(var x, var expectedType) {
  Expect.equals(Null, x.runtimeType);
  Expect.isTrue(x == null);
  Expect.isTrue(x is Null);
  Expect.isFalse(x is NonNull(expectedType));
}

main() {
  checkme(null, Null);

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

  Null n = null;
  checkme(n, Null);

  AA ? aa = null;
  checkme(aa, AA);
  checkme(aa, A);

  AAA aaa = null;
  checkme(aaa, AAA);
  checkme(aaa, A);
}

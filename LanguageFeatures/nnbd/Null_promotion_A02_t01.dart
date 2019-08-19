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
 * @description Check that type of [e] is promoted to [T] in the [true]
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
  Expect.isTrue(x != null);
  Expect.isTrue(x is expectedType);
}

main() {
  A ? a = A();
  checkme(a, A);

  B ? b1 = B();
  checkme(b1, B);

  B<int> ? b2 = B<int>();
  checkme(b2, B);

  Object ? o = 12345;
  checkme(o, Object);

  AA ? aa = A();
  checkme(aa, AA);
  checkme(aa, A);

  AAA aaa = A();
  checkme(aaa, AAA);
  checkme(aaa, A);
}

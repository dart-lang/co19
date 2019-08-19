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
 * @description Check that [e] is promoted to [NonNull(T)] in the [false]
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
  Expect.isFalse(x == null);
  Expect.isFalse(x is Null);
  Expect.isTrue(x is NonNull(expectedType));
  Expect.isTrue(x is NonNull(Object));
}

main() {
  A a1 = A();
  checkme(a1, A);

  A? a2 = A();
  checkme(a2, A);

  B b1 = B();
  checkme(b1, B);

  B? b2 = B();
  checkme(b2, B);

  B<int> b3 = B<int>();
  checkme(b3, B);

  B<int> ? b4 = B<int>();
  checkme(b4, B);

  dynamic d = 12345;
  checkme(d, int);
  checkme(d, dynamic);

  Object o = "14";
  checkme(o, String);
}

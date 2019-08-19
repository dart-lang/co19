/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of an expression [e!] is [NonNull(T)] where [T] is
 * the static type of [e].
 *
 * @description Check that [e!] is [NonNull(T)] if [e] is of static type [T}.
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable,nonfunction-type-aliases

import "../../Utils/expect.dart";

class A {}
class B<T> {}

typedef AA = A;
typedef AAA = A?;

main() {
  A a = A();
  Expect.isTrue(a! is NonNull(A));

  B b1 = B();
  Expect.isTrue(b1! is NonNull(B));

  B<int> b2 = B<int>();
  Expect.isTrue(b2! is NonNull(B<int>));

  AA aa = AA();
  Expect.isTrue(aa! is NonNull(AA));

  AAA aaa = AAA();
  Expect.isTrue(aaa! is NonNull(AAA));
}

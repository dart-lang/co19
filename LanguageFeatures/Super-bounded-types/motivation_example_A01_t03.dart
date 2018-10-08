/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Here are some examples of finite unfoldings, and the effect they have on
 * types of expressions:
 * c1.next.next.unknown(44); // Statically OK.
 * @description Checks that [c1.next.next.unknown(44)] line from the test
 * example is statically OK and throws [NoSuchMethodError] in runtime.
 * @author iarkh@unipro.ru
 * @issue #32903
 */
import "../../Utils/expect.dart";

class C<X extends C<X>> {
  X next;
  C(this.next);
}

class D extends C<D> {
  D(D next): super(next);
}

main() {
  D d = new D(new D(null));
  C<C<dynamic>> c1 = d;
  Expect.throws(() {
    c1.next.next.unknown(44);
  }, (e) => e is NoSuchMethodError);
}

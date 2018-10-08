/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Here are some examples of finite unfoldings, and the effect they have on
 * types of expressions:
 * c0.next.unknown(42); // Statically OK, `c0.next` is `dynamic`.
 * @description Checks that [c0.next.unknown(42)] line from the test example is
 * statically OK and causes [NoSuchMethodError] in runtime.
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
  C<dynamic> c0 = d;
  Expect.throws(() { c0.next.unknown(42); }, (e) => e is NoSuchMethodError);
}

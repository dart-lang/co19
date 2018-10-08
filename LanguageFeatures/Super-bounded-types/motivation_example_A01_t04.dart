/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Here are some examples of finite unfoldings, and the effect they have on
 * types of expressions:
 * c2.next.next.unknown(45); // Compile-time error.
 * @description Checks that [c2.next.next.unknown(45)] line from the test
 * example causes compile-time error and throws error in runtime
 * @author iarkh@unipro.ru
 * @compile-error
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
  C<C<C<dynamic>>> c2 = d;
  Expect.throws(() {
    c2.next.next.unknown(45); // Compile-time error.
  });
}

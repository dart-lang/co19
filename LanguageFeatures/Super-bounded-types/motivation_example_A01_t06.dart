/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Here are some examples of finite unfoldings, and the effect they have on
 * types of expressions:
 *   d.next.next.next.next.next.next.next.unknown(46); // Compile-time error.
 * @description Checks that [d.next.next.next.next.next.next.next.unknown(46)]
 * line from the test example causes compile-time error and throws error in
 * runtime
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
  // With type `D`, the static analysis is aware of the cyclic
  // structure of the type, and every level of nesting is handled
  // safely. But `D` may be less useful because there may be a
  // similar type `D2`, and this code will only work with `D`.
  Expect.throws(() {
    d.next.next.next.next.next.next.next.unknown(46); // Compile-time error.
  });
}

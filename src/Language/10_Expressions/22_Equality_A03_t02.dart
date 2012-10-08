/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of an equality expression ee of the form super == e
 * proceeds as follows:
 * • The expression e is evaluated to an object o.
 * • If either this or o is null, then ee evaluates to identical(this, o).
 *   Otherwise, ee is equivalent to the method invocation super.==(o).
 * @description Checks that if o is null, the operator super.==(o) is not called.
 * @author msyabro
 * @reviewer kaigorodov
 */

class S {
  operator == (other) {
    throw 'This operator should not be invoked.';
  }
}

class C extends S {
  test() {
    Expect.isFalse(super == null);
  }
}

main() {
  new C().test();

}


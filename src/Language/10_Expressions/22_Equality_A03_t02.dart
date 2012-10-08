/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of an equality expression ee of the form super == e proceeds as
 * follows:
 * - The expression e is evaluated to an object o.
 * - If this === o evaluates to true, then ee evaluates to true. Otherwise,
 * - If either this or o is null, then ee evaluates to false. Otherwise,
 * - ee is equivalent to the method invocation super.equals(o).
 * @description Checks that if o is null, the result of an
 * equality expression is false.
 * @author msyabro
 * @reviewer kaigorodov
 * @note issue 1242
 */

class S {
  operator equals(other) {
    throw 'This operator should not be invoked.';
  }
}

class C {
  test() {
    Expect.isFalse(super == null);
  }
}

main() {
  new C().test();

}


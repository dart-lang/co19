/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An equality expression of the form super != e
 * is equivalent to the expression !(super == e).
 * @description Checks that expression of the form super != e  is
 * equivalent to the expression !(super == e).
 * @author msyabro
 * @reviewer kaigorodov
 * @needsreview issue 1242
 */

class S{
  operator==(var val) {
    if(this === val) {
      return true;
    } else {
       return false;
    }
  }
}

class A extends S{
  test() {
    A a = new A();
    Expect.equals(super != this, !(super == this));
    Expect.equals(super != a, !(super == a));
  }
}

main() {
  A a = new A();
  a.test();
}

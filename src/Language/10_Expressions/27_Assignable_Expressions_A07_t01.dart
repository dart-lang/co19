/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An assignable expression of the form e.id(a1, ..., an) is evaluated as a method invocation.
 * @description Checks that expression of the form e.id(a1, ..., an) is evaluated as a method invocation.
 * @static-warning
 * @author msyabro
 * @reviewer iefremov
 */

class A {
  id(p1, p2, p3) => p1 + p2 - p3;
}

main() {
  A a = new A();
  Expect.equals(1, a.id(1, 1, 1));
  Expect.equals(2, a.id(1, 1, 0));
  Expect.equals(10, a.id(5, 6, 1));
  Expect.equals(0, a.id(0, 0, 0));

  Expect.throws( () => a.id(),           (e) => e is NoSuchMethodException);
  Expect.throws( () => a.id(1, 2, 3, 4), (e) => e is NoSuchMethodException);
  Expect.throws( () => a.m(),            (e) => e is NoSuchMethodException);
  Expect.throws( () => a.m(1,2 ,3),      (e) => e is NoSuchMethodException);
}
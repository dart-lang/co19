/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool every(bool f(E element))
 * Checks whether every element of this iterable satisfies test.
 * Checks every element in iteration order, and returns false if any of them
 * make test return false, otherwise returns true.
 * @description Checks that something is thrown if the argument
 * is not a closure, doesn't implement a call() method with appropriate
 * signature or is null.
 * @author vasya
 */
library every_A03_t01;

import "../../../Utils/expect.dart";

class A {
  A() {}
}

test(Iterable create([Iterable content])) {
  dynamic a = create([1, 2, 3]);
  dynamic x1 = false;
  dynamic x2 = 1;
  dynamic x3 = "every";
  dynamic x4 = [1, 2, 3];
  dynamic x5 = new A();
  dynamic x6 = null;

  Expect.throws(() => a.every(x1));
  Expect.throws(() => a.every(x2));
  Expect.throws(() => a.every(x3));
  Expect.throws(() => a.every(x4));
  Expect.throws(() => a.every(x5));
  Expect.throws(() => a.every(x6));
}

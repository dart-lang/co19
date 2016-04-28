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
 * @static-warning
 * @description Checks that something is thrown if the argument
 * is not a closure, doesn't implement a call() method with appropriate
 * signature or is null.
 * @author vasya
 * @reviewer iefremov
 * @reviewer msyabro
 * @reviewer varlax
 */
library every_A03_t01;

import "../../../Utils/expect.dart";

class A {
  A() {}
}

test(Iterable create([Iterable content])) {
  Iterable a = create([1, 2, 3]);

  Expect.throws(() => a.every(false)); /// static type warning not assignable
  Expect.throws(() => a.every(1)); /// static type warning not assignable
  Expect.throws(() => a.every("every")); /// static type warning not assignable
  Expect.throws(() => a.every([1, 2, 3])); /// static type warning not assignable
  Expect.throws(() => a.every(new A())); /// static type warning not assignable
  Expect.throws(() => a.every(null));
}

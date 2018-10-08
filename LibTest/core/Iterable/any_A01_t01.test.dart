/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool any(bool f(E element))
 * Checks whether any element of this iterable satisfies test.
 * Checks every element in iteration order, and returns true if any of them make
 * test return true, otherwise returns false.
 * @description Checks that this method returns true if any of the elements of
 * this Iteratable make test return true, otherwise returns false.
 * @author pagolubev
 * @author sgrekhov@unipro.ru
 */
library any_A01_t01;
import "../../../Utils/expect.dart";

test(Iterable create([Iterable content])) {
  bool foo(var x) { return x > 0; }

  Expect.isFalse(create().any(foo));
  Expect.isFalse(create([-1, -3, -11]).any (foo));
  Expect.isTrue(create([-1, -3, -11, 5]).any(foo));
  Expect.isTrue(create([-1, -3, -11, 5, 3]).any(foo));
}

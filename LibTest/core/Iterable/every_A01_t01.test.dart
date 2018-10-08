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
 * @description Check that true is returned only if every element of the list
 * satisfies the predicate [f].
 * @author vasya
 */
library every_A01_t01;

import "../../../Utils/expect.dart";

test(Iterable create([Iterable content])) {
  Iterable a = create([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
  Expect.isTrue(a.every((var e) { return (e >= 0 && e < 10); } ));
  Expect.isFalse(a.every((var e) { return (e < 0); } ));

  a = create([1, 2, 3]);
  bool f (var e) { return (e > 0); }
  Expect.isTrue(a.every(f));

  a = create([-1, -2, -3, 1, 2, 3]);
  Expect.isFalse(a.every(f));
}

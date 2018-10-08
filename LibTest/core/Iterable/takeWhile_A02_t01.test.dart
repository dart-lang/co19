/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> takeWhile(bool test(E value))
 * The filtering happens lazily. Every new iterator of the returned iterable
 * starts iterating over the elements of this.
 * @description Checks that the test method is not called when the takeWhile is
 * executed.
 * @author kaigorodov
 */
library takeWhile_A02_t01;
import "../../../Utils/expect.dart"	;

bool f(var value) {
  Expect.fail("test($value) called");
  return false;
}

test(Iterable create([Iterable content])) {
  create([]).takeWhile(f);
  create([1]).takeWhile(f);
  create([1, 3, 7, 4, 5, 6]).takeWhile(f);
}

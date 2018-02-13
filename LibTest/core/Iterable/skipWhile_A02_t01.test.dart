/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> skipWhile(bool test(E value))
 * The filtering happens lazily.
 * @description Checks that the test method is not called when the skipWhile is
 * executed.
 * @author kaigorodov
 */
library skipWhile_A02_t01;
import "../../../Utils/expect.dart"	;

bool f(var value) {
  Expect.fail("test($value) called");
  return false;
}

test(Iterable create([Iterable content])) {
  create([]).skipWhile(f);
  create([1]).skipWhile(f);
  create([1,3,7,4,5,6]).skipWhile(f);
}

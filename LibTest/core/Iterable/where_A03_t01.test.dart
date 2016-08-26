/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> where(bool f(E element))
 * ...
 * This method returns a view of the mapped elements. As long as the returned
 * Iterable is not iterated over, the supplied function test will not be invoked
 * @description Checks that as long as the returned Iterable is not iterated
 * over, the supplied function test will not be invoked
 * @author sgrekhov@unipro.ru
 */
library where_A03_t01;
 
import "../../../Utils/expect.dart";

bool f(var value) {
  Expect.fail("test($value) called");
  return false;
}

test(Iterable create([Iterable content])) {
  create([]).where(f);
  create([1]).where(f);
  create([1, 3, 7, 4, 5, 6]).where(f);
}

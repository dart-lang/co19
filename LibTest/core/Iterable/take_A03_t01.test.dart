/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> take(int count)
 * The returned Iterable may contain fewer than count elements, if this contains
 * fewer than count elements.
 * @description Checks that if Iterable contains fewer than count elements then
 * resulting Iterable contain fever than n elements
 * @author sgrekhov@unipro.ru
 */
library take_A03_t01;
import "../../../Utils/expect.dart";

check(Iterable a) {
  Iterable it = a.take(a.length + 1);
  Expect.equals(a.length, it.length);
}

test(Iterable create([Iterable content])) {
  check(create([]));
  check(create([1]));
  check(create([11, 2]));
  check(create([1, 22, -3, 4]));
  check(create(const[]));
  check(create(const[1]));
  check(create(const[0, 0, 1, 2]));
  check(create(const[0, 0, 1, 2, -5, -6]));
}

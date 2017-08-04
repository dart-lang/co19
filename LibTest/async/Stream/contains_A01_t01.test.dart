/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<bool> contains(Object needle)
 * Checks whether needle occurs in the elements provided by this stream.
 * @description Checks that the method correctly checks whether match
 * occurs in the elements provided by this stream.
 * @author kaigorodov
 */
library contains_A01_t01;
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

void check(Stream<T> s, Object match, bool expected) {
  asyncStart();
  Future<bool> future = s.contains(match);
  future.then((actual){
    Expect.equals(expected, actual);
    asyncEnd();
  });
}

void test(Stream<T> create(Iterable<T> data)) {
  check(create([]), null, false);
  check(create([1, 2, []]), null, false);
  check(create([1, 2 ,null, []]), null, true);
  check(create([1, 2, []]), 4, false);
  check(create([1, 2, null, []]), 2, true);
}

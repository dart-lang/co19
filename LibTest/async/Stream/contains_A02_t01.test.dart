/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<bool> contains(Object needle)
 * Completes the Future when the answer is known.
 * @description Checks that the Future is completed when the answer is known.
 * @author kaigorodov
 * @author a.semenov@unipro.ru
 */
library contains_A02_t01;
import "dart:async";
import "../../../Utils/expect.dart";

void check<T>(Stream<T> s, Object match, bool expected) {
  List seen = [];
  s = s.map((x) {
    seen.add(x);
    return x;
  });
  asyncStart();
  s.contains(match).then((actual) {
    Expect.equals(expected, actual);
    if (expected) {
      Expect.equals(match, seen.last);
      Expect.equals(seen.length-1, seen.indexOf(match));
    } else {
      Expect.isFalse(seen.contains(match));
    }
    asyncEnd();
  });
}

void test(CreateStreamFunction create) {
  check(create([]), null, false);
  check(create([1, 2 ,[]]), null, false);
  check(create([1, 2 ,null, []]), null, true);
  check(create([1, 2, []]), 4, false);
  check(create([1, 2, null, []]), 2, true);
  check(create([1, 2, 1, 2, 3]), 2, true);
}

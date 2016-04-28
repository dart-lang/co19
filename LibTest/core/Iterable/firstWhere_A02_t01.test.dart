/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E firstWhere(bool test(E element), {E orElse()})
 * Returns the first element that satisfies the given predicate test.
 * Iterates through elements and returns the first to satsify test.
 * If no element satisfies test, the result of invoking the orElse function
 * is returned. If orElse is omitted, it defaults to throwing a StateError.
 * @description Checks that the result of invoking the orElse function is
 * returned if no matches found.
 * @author kaigorodov
 */
library firstWhere_A02_t01;
import "../../../Utils/expect.dart";

class TestException {}

check(Iterable list) {
  Expect.throws(() {
      list.firstWhere((var value) => false,
          orElse: (){throw new TestException();});
    }, (e) => e is TestException
  );
}

test(Iterable create([Iterable content])) {
  check(create());
  check(create([]));
  check(create(const[]));
  check(create([1, 2, 3]));
}

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
 * @description Checks that a StateError is thrown when orElse is null and
 * none matches.
 * @author kaigorodov
 */
library firstWhere_A03_t01;
import "../../../Utils/expect.dart";

check(Iterable list) {
    Expect.throws(() {
      list.firstWhere((var value) => false);
    }, (e) => e is StateError
  );
}

test(Iterable create([Iterable content])) {
  check(create());
  check(create([]));
  check(create(const[]));
  check(create([1, 2, 3]));
}

/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E last
 * Returns the last element.
 * Throws a StateError if this is empty. Otherwise may iterate through the
 * elements and returns the last one seen. Some iterables may have more
 * efficient ways to find the last element (for example a list can directly
 * access the last element, without iterating through the previous ones).
 * @description Checks that StateError is thrown if this Iteratable is empty.
 * @author kaigorodov
 */
library last_A02_t01;
 
import "../../../Utils/expect.dart";

test(Iterable create([Iterable content])) {
  check(Iterable a) {
    Expect.throws(() {a.last;}, (e)=> e is StateError );
  }

  check(create());
  check(create([]));
  check(create(const[]));
}

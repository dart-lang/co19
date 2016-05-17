/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E lastWhere(bool test(E value), {E orElse()})
 * Returns the last element that satisfies the given predicate f.
 * If none matches, the result of invoking the orElse function is returned.
 * By default, when orElse is null, a StateError is thrown.
 * @description Checks that the correct value is returned, if the element is
 * present in the list.
 * @author kaigorodov
 */
library lastWhere_A01_t01;

import "../../../Utils/expect.dart";

void check(Iterable a, var element) {
  Expect.equals(element, a.lastWhere((var value) => value == element));
}

test(Iterable create([Iterable content])) {
  Iterable a = create([42, 0, -1, 42, -1, 6031769, 0]);
  check(a, 42);
  check(a, 0);
  check(a, -1);
  check(a, 6031769);
}

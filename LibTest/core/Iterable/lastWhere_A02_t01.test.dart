/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E lastWhere(bool test(E value), {E orElse()})
 * If none matches, the result of invoking the orElse function is returned.
 * @description Checks that If none matches, the result of invoking the orElse
 * function is returned.
 * @author kaigorodov
 */
library lastWhere_A02_t01;

import "../../../Utils/expect.dart";

var noneMatches = new Object();

void check(Iterable a, var element) {
  Expect.identical(noneMatches,
      a.lastWhere((var value) => value == element, orElse: () => noneMatches));
}

test(Iterable create([Iterable content])) {
  Iterable a = create([42, 0, -1, 42, -1, 6031769, 0]);
  check(a, 43);
  check(a, 2);
  check(a, -2);
  check(a, 6031768);
}

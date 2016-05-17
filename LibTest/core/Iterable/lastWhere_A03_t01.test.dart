/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E lastWhere(bool test(E value), {E orElse()})
 * By default, when orElse is null, a StateError is thrown.
 * @description Checks that If none matches and orElse is null,
 * a StateError is thrown.
 * @author kaigorodov
 */
library lastWhere_A03_t01;

import "../../../Utils/expect.dart";

void check(Iterable a, var element) {
  Expect.throws(() {a.lastWhere((var value) => value == element);},
      (e) => e is StateError);
}

test(Iterable create([Iterable content])) {
  Iterable a = create([42, 0, -1, 42, -1, 6031769, 0]);
  check(a, 43);
  check(a, 2);
  check(a, -2);
  check(a, 6031768);
}

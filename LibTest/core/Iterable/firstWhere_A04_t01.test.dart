/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E firstWhere(bool test(E element), {E orElse()})
 * Returns the first element that satisfies the given predicate test.
 * Iterates through elements and returns the first to satsify test.
 * If no element satisfies test, the result of invoking the orElse function
 * is returned. If orElse is omitted, it defaults to throwing a StateError.
 * @description Checks that the first element that satisfies the given predicate
 * test is returned
 * @author sgrekhov@unipro.ru
 */
library firstWhere_A04_t01;

import "../../../Utils/expect.dart";

class C {
  int val;
  C(this.val);
}

test(Iterable create([Iterable content]), {bool isSet: false}) {
  C c1 = new C(42);
  C c2 = new C(42);

  Iterable a = create([c1, c2]);
  C found = a.firstWhere((var value) {
    if (value is C) {
      return value.val == 42;
    }
    return false;
  }, orElse: () => null);
  if (isSet) {
    // Set may be unordered so the first element that satisfies the test is
    // unpredictable. Just test that something is returned
    Expect.isNotNull(found);
  } else {
    if (found != null) {
      Expect.identical(c1, found);
      Expect.notEquals(c2, found);
    }
  }
}

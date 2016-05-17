/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E lastWhere(bool test(E element), {E orElse()})
 * Returns the last element that satisfies the given predicate test
 * @description Checks that the last element that satisfies the given predicate
 * test is returned
 * @author sgrekhov@unipro.ru
 */
library lastWhere_A04_t01;

import "../../../Utils/expect.dart";

class C {
  int val;
  C(this.val);
}

test(Iterable create([Iterable content]), {bool isSet: false}) {
  C c1 = new C(42);
  C c2 = new C(42);

  Iterable a = create([c1, c2]);
  C found = a.lastWhere((var value) {
    if (value is C) {
      return value.val == 42;
    }
    return false;
  }, orElse: () => null);
  if (!isSet) {
    if (found != null) {
      Expect.identical(c2, found);
      Expect.notEquals(c1, found);
    }
  } else {
    // Set may be unordered so the last element that satisfies the test is
    // unpredictable. Just test that something is returned
    Expect.isNotNull(found);
  }
}

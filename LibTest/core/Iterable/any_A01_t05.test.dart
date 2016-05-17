/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool any(bool f(E element))
 * Checks whether any element of this iterable satisfies test.
 * Checks every element in iteration order, and returns true if any of them make
 * test return true, otherwise returns false.
 * @description Checks that method is called for each element until the first
 * true result
 * @author pagolubev
 * @author sgrekhov@unipro.ru
 */
library any_A01_t05;
import "../../../Utils/expect.dart";

//Checks that [some] calls [tst] a [count] number of times
check(Iterable a, bool tst(var e), int count) {
  int actualCount = 0;
  a.any((var e) {
    actualCount++;
    return tst(e);
  });
  Expect.equals(count, actualCount);
}

test(Iterable create([Iterable content])) {
  Iterable s = create([1, 2, 3, 4, 5]);

  bool allTrue(var e) {
    return true;
  }
  check(s, allTrue, 1);

  bool allFalse(var e) {
    return false;
  }
  check(s, allFalse, 5);

  bool greaterThan3(var e) {
    return e > 3;
  }
  check(s, greaterThan3, 4);
}


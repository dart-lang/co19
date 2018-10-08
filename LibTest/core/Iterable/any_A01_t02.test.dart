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
 * @description Checks that if test always returns false, then it is called for
 * each element of this iteratable
 * @author pagolubev
 * @author sgrekhov@unipro.ru
 */
library any_A01_t02;
import "../../../Utils/expect.dart";

test(Iterable create([Iterable content])) {
  Iterable s = create([1, -3, 10, 17]);

  Set outer = new Set();
  s.any((var x) {
    outer.add(x);
    return false;
  });
  Expect.isTrue(outer.containsAll(s));
}

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
 * @description Checks that invoking any() doesn't change the set by itself
 * @author pagolubev
 * @author sgrekhov@unipro.ru
 */
library any_A01_t03;
import "../../../Utils/expect.dart";

test(Iterable create([Iterable content])) {
  bool foo(var x) { return x > 0; }

  Iterable s = create([-1, -3, -11]);
  List content = new List.from(s);
  Expect.isFalse(s.any(foo));

  Expect.equals(content.length, s.length);
  int k = 0;
  for (Object o in s) {
    Expect.equals(content[k++], o);
  }
}

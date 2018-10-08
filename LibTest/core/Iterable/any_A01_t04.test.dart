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
 * @description Checks that this method works as specified.
 * @author pagolubev
 * @author sgrekhov@unipro.ru
 */
library any_A01_t04;
import "../../../Utils/expect.dart";

test(Iterable create([Iterable content])) {
  Expect.isTrue(create([0, 1, 2, 3]).any((var e) { return (e > 1 && e < 3); } ));
  Expect.isFalse(create([1, 2, 3]).any((var e) { return (e < 0); } ));
  Expect.isTrue(create([null]).any((var e) { return true; } ));
  Expect.isFalse(create([null]).any((var e) { return false; } ));

  bool f1(var e) { return (e > 1); }
  Expect.isTrue(create([1, 2, 3, 4]).any(f1));
}

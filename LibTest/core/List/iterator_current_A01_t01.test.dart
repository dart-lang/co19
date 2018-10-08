/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final E current
 * Gets the current element in the iteration.
 * @description Checks that the current element in the iteration is returned.
 * @author kaigorodov
 */
library iterator_current_A01_t01;

import "../../../Utils/expect.dart";

test(List create([int length])) {
  List a = create(25476);
  Iterator it = a.iterator;
  for (var i = 0; i < a.length; i++) {
    it.moveNext();
    Expect.equals(null, it.current);
  }
}

/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E elementAt(int index)
 * Returns the indexth element.
 * The index must be non-negative and less than length. Index zero represents
 * the first element (so iterable.elementAt(0) is equivalent to iterable.first).
 * May iterate through the elements in iteration order, skipping the first index
 * elements and returning the next. Some iterable may have more efficient ways
 * to find the element.
 * @description Checks that the indexth element is returned.
 * @author kaigorodov
 */
library elementAt_A01_t01;

import "../../../Utils/expect.dart";

test(Iterable create([Iterable content]), {bool isSet: false}) {
  List b = [5, 4, 3, 2, 1, 0, 6];
  Iterable a = create(b);
  if (isSet) {
    // just check that elementAt(i) returns different elements for different i
    for (int i = 0; i < a.length; i++) {
      for (int j = 0; j < a.length; j++) {
        if (i != j) {
          Expect.notEquals(a.elementAt(i), a.elementAt(j));
        }
      }
    }
  } else {
    for (int i = 0; i < a.length; i++) {
      Expect.equals(b[i], a.elementAt(i));
    }
  }
}

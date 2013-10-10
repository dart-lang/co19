/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If this collection is empty, returns true.
 * @needsreview not documented
 * @description Checks that [f] is not called if list is empty
 * @author kaigorodov
 */
library elementAt_A02_t02;

import "../../../Utils/expect.dart";

test(Iterable create([Iterable content])) {

  List a=create();

  int actualCount = 0;
  a.every((var e) {
    actualCount++;
    return predicate(e);
  });
  Expect.equals(0, actualCount);
}

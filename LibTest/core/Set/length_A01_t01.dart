/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int length
 * Returns the number of elements in the collection.
 * @description Checks that the value returned by length is correct in various
 * scenarios.
 * @author pagolubev
 */
library length_A01_t01;
import "set.lib.dart";
import "../../../Utils/expect.dart";

test(Set create([Set content])) {
  Set s = create();
  Expect.isTrue(s.length == 0);

  int n = 20;
  for(int i = 0; i < n; i++) {
    Expect.isTrue(s.length == i);
    s.add(i);
  }
  Expect.isTrue(s.length == n);

  s.clear();
  Expect.isTrue(s.length == 0);
}

main() {
  test(create);
}

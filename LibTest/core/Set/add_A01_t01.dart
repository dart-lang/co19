/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void add(T value)
 * Adds [value] into the set. The method has no effect if [value] was already in
 * the set.
 * @description Checks that the value is added to the set if it doesn't already
 * contain an equal one.
 * @author pagolubev
 */
library add_A01_t01;
import "set.lib.dart";
import "../../../Utils/expect.dart";

test(Set create([Set content])) {
  Set s = create();

  int firstValue  = 27;
  int numValues = 19;
  for(int i = firstValue; i < firstValue + numValues; i++) {
    s.add(i);
    int expectedSize = i - firstValue + 1;
    Expect.isTrue(s.contains(i));
    Expect.isTrue(s.length == expectedSize);

    s.add(i);
    Expect.isTrue(s.length == expectedSize);
    Expect.isTrue(s.contains(i));
  }
}

main() {
  test(create);
}

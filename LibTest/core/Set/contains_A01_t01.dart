/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool contains(T value)
 * Returns true if [value] is in the set.
 * @description Checks that this method returns true if an element was added to
 * the set prior to that (and not removed since) and false otherwise.
 * @author pagolubev
 */
library contains_A01_t01;
import "set.lib.dart";
import "../../../Utils/expect.dart";

test(Set create([Set content])) {
  Set s = create();

  int firstValue  = 27;
  int numValues = 19;
  for(int i = firstValue; i < firstValue + numValues; i++) {
    Expect.isFalse(s.contains(i));
    s.add(i);
    Expect.isTrue(s.contains(i));
  }
}

main() {
  test(create);
}

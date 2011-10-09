/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void add(T value)
 * Adds [value] into the set. The method has no effect if [value] was already in the set.
 * @description Checks that addding null will raise an exception.
 * @author pagolubev
 * @needsreview Behavior of add() when passed null is not specified. Assumption: NullPointerException.
 * @reviewer msyabro
 */


main() {
  Set<int> s = new Set<int>();
  try {
    s.add(null);
    Expect.fail("Expected NullPointerException.");
  } catch (NullPointerException e) {
  }
}

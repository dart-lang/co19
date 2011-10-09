/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool contains(T value)
 * Returns true if [value] is in the set.
 * @description Passes null to contains().
 * @author pagolubev
 * @needsreview Behavior is not specified. Assumes NullPointerException.
 * @reviewer msyabro
 */


main() {
  Set<int> s = new Set<int>();
  try {
    s.contains(null);
    Expect.fail("Expected NullPointerException.");
  } catch (NullPointerException e) {
  }
}

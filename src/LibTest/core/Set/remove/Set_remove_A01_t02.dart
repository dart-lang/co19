/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool remove(T value)
 * Removes [value] from the set. Returns true if [value] was in the set.
 * Returns false otherwise. The method has no effect if [value] value was not in the set.
 * @description Passes null to remove().
 * @author pagolubev
 * @needsreview Behavior not specified. Assumes NullPointerException.
 * @reviewer msyabro
 */


main() {
  Set<int> s = new Set<int>();
  try {
    s.remove(null);
    Expect.fail("Expected NullPointerException.");
  } catch (NullPointerException e) {
  }

  s.addAll([1, 2]);

  try {
    s.remove(null);
    Expect.fail("Expected NullPointerException.");
  } catch (NullPointerException e) {
  }
}

/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void addAll(Collection<T> collection)
 * Adds all the elements of the given collection to the set.
 * @description Passes a list containing null to addAll(), expects a NullPointerException.
 * @author pagolubev
 * @needsreview Behavior not specified. Test assumes NullPointerException.
 * @reviewer msyabro
 */


main() {
  Set<int> s = new Set<int>();

  try {
    s.addAll([null]);
    Expect.fail("Expected NullPointerException");
  } catch (NullPointerException e) {
  }

  try {
    s.addAll([1, 2, null]);
    Expect.fail("Expected NullPointerException");
  } catch (NullPointerException e) {}
}

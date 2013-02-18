/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void removeAll(Collection<T> collection)
 * Removes all the elements of the given collection from the set.
 * @description Passes a list containing null as argument to removeAll(), expects no errors.
 * @author pagolubev
 * @reviewer msyabro
 */

main() {
  Set<int> s = new Set<int>();
  s.removeAll([null]);
  Expect.equals(0, s.length);
  s.removeAll([1, 2, null]);
  Expect.equals(0, s.length);

  s.addAll([1, 2]);
  s.removeAll([null]);
  Expect.equals(2, s.length);
  s.removeAll([1, 2, null]);
  Expect.equals(0, s.length);
}

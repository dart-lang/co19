/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void clear()
 * Removes all elements of the collection.
 * @description Checks that clear() indeed removes all elements from the set.
 * @author pagolubev
 * @reviewer msyabro
 */


main() {
  Set<int> s = new Set<int>();

  s.clear();
  Expect.isTrue(s.length == 0);

  s.add(1);
  s.clear();
  Expect.isTrue(s.length == 0);

  s.addAll([1, -1, 3]);
  s.clear();
  Expect.isTrue(s.length == 0);
}

/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void addAll(Collection<T> collection)
 * Adds all the elements of the given collection to the set.
 * @description Simple checks.
 * @author pagolubev
 * @reviewer msyabro
 */


main() {
  Set<int> s = new Set<int>();

  s.addAll([]);
  Expect.isTrue(s.length == 0);

  Array<int> a = [1, 3, 3, 3, 7, -7, 3, 3, 9];
  s.addAll(a);
  Expect.isTrue(s.length == 5);
  for(int i = 0; i < a.length; i++) {
    Expect.isTrue(s.contains(a[i]));
  }
}

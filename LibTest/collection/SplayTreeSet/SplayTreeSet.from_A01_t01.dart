/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion SplayTreeSet.from(Iterable elements, [int compare(E key1, E key2),
 * bool isValidKey(potentialKey)])
 * Creates a SplayTreeSet that contains all [elements]
 * @description Checks that a SplayTreeSet that contains all elements is created
 * @author sgrekhov@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";

void check(Iterable source, Iterable expected) {
  SplayTreeSet set = new SplayTreeSet.from(source);
  for (int i = 0; i < expected.length; i++) {
    Expect.equals(expected.elementAt(i), set.elementAt(i));
  }
}

main() {
  check([], []);
  check([1, 2, 3], [1, 2, 3]);
  check([1, 1, 2, 2, 3, 3, -1], [-1, 1, 2, 3]);
  check([4, 3, 3, 5, 1, 5], [1, 3, 4, 5]);
}

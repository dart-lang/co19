/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory LinkedHashSet.from(Iterable<E> iterable)
 * Create a linked hash set containing all [elements]
 * Creates a linked hash set as by [new LinkedHashSet<E>()] and adds each
 * element of [elements] to this set in the order they are iterated.
 * @description Checks that new set contains elements in the order they are
 * iterated
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

check(Iterable iterable, Iterable expected) {
  LinkedHashSet set = new LinkedHashSet.from(iterable);
  int i = 0;
  for(var v in expected) {
    Expect.equals(v, set.elementAt(i++));
  }
}

main() {
  check([], []);
  check([1, 2, 3], [1, 2, 3]);
  check(["1", 1, 2, 2, 3, 3, "4", 4], ["1", 1, 2, 3, "4", 4]);
  check([1, 2, 3, 1, 1, 1], [1, 2, 3]);
}

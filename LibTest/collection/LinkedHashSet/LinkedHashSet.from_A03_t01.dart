/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion LinkedHashSet.from(Iterable<E> elements)
 * ...
 * All the [elements] should be assignable to [E]. The [elements] iterable
 * itself may have any element type, so this constructor can be used to
 * down-cast a [Set]
 * @description Checks that the elements of the iterable may have any element
 * type, so this constructor can be used to down-cast a [Set]
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

check(LinkedHashSet set, Iterable expected) {
  int i = 0;
  for(var v in expected) {
    Expect.equals(v, set.elementAt(i++));
  }
}

main() {
  LinkedHashSet<num> superSet =
      new LinkedHashSet<num>.from([0, 1, 2.0, 3.14, 4]);
  Iterable<num> tmp = superSet.where((v) => v is int);
  LinkedHashSet<int> subSet = new LinkedHashSet<int>.from(tmp);
  check(subSet, [0, 1, 4]);
}

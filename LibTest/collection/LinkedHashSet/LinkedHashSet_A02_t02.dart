/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion LinkedHashSet({bool equals(E e1, E e2), int hashCode(E e),
 * bool isValidKey(potentialKey)})
 * Create an insertion-ordered hash set using the provided [equals] and
 * [hashCode].
 * @description Checks that [LinkedHashSet] preserves insertion order if
 * [addAll] is used to add elements to the map.
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

checkOrder(Set set, List valuesOrder) {
  var idx = 0;
  for(var v in set) {
    Expect.equals(valuesOrder[idx++], v);
  }
}

main() {
  LinkedHashSet set = new LinkedHashSet();
  set.add(1);
  set.add(2);
  set.add(3);
  checkOrder(set, [1, 2, 3]);

  set.addAll([4, 5, 6]);
  checkOrder(set, [1, 2, 3, 4, 5, 6]);

  set.addAll([1, 2, 3]);
  checkOrder(set, [1, 2, 3, 4, 5, 6]);

  set.addAll([1, 2, 0]);
  checkOrder(set, [1, 2, 3, 4, 5, 6, 0]);
}

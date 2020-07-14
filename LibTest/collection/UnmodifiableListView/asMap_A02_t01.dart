/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract Map<int, E> asMap()
 * The [Map.keys] [Iterable] iterates the indices of this list in numerical
 * order.
 * @description Checks that [Map.keys] iterates the indices of this list in
 * numerical order.
 * @author iarkh@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";

void check(List a0) {
  UnmodifiableListView a = new UnmodifiableListView(a0);
  var map = a.asMap();

  int key1 = 0;
  Iterator keys2 = map.keys.iterator;

  for (; ;) {
    if (key1 == a.length) {
      Expect.isFalse(keys2.moveNext());
      break;
    }
    Expect.isTrue(keys2.moveNext());
    Expect.equals(key1, keys2.current);
    key1++;
  }
}

main() {
  List a = new List();
  check(a);
  a.add(2);
  check(a);
  a.add(1);
  check(a);
  a.add(1);
  check(a);
  a.add("1");
  check(a);
  a.clear();
  check(a);
}

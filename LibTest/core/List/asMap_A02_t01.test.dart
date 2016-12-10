/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion   abstract Map<int, E> asMap()
 * The Map.keys Iterable iterates the indices of this list in numerical order.
 * @description Checks that Map.keys iterates the indices of this list in
 * numerical order.
 * @author kaigorodov
 */
library asMap_A02_t01;

import "../../../Utils/expect.dart";

test(List create([int length])) {

  void check(List a0) {
    List a = create(a0.length);
    Expect.equals(a0.length, a.length);
    a.setRange(0, a0.length, a0);
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

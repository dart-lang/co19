/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<E> toList({bool growable: true})
 * The list is fixed-length if [growable] is [false].
 * @description Checks that the list created with growable == true can change
 * its size.
 * @author kaigorodov
 */

import "dart:collection";
import "../../../Utils/expect.dart";

void check(List l) {
  int len = l.length;
  l.add(null);
  Expect.equals(len + 1, l.length);

  l.clear();
  Expect.equals(0, l.length);
}

main() {
  DoubleLinkedQueue<int> q = new DoubleLinkedQueue<int>();
  for (var i = 0; i < 10; i++){
    q.add(i);
  }
  check(q.toList());
}

/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E elementAt(int index)
 * Returns the indexth element.
 * If this has fewer than index elements throws a RangeError.
 * @description Checks that a RangeError is thrown if this has fewer than index
 * elements.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";
import "dart:collection";

DoubleLinkedQueue queue = new DoubleLinkedQueue();

void check(int index) {
  Expect.throws(() {
    queue.elementAt(index);
    },
    (e)=> e is RangeError
  );
}

main() {
  check(0);
  
  queue.addFirst(1);
  check(1);
  check(2);

  queue.addFirst(2);
  check(2);

  queue.clear();
  check(0);
  check(1000);
}

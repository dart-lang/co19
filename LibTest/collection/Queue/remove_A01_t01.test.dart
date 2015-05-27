/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  abstract bool remove(Object object)
 * Remove a single instance of value from the queue.
 * Returns true if a value was removed, or false if the queue contained no element equal to value.
 * @description Checks that the method returns true if a value was removed,
 * or false if the queue contained no element equal to value..
 * @author kaigorodov
 */
library remove_A01_t01;

import "../../../Utils/expect.dart";

check(Iterable a, Object value, bool expected) {
  Queue queue = create(a);
  var l1=queue.length;
  bool r = queue.remove(value);
  Expect.isTrue(r is bool, "remove returned: ${r.runtimeType} ${r}, not bool");
  if (r) {
     Expect.isTrue(expected);
     Expect.equals(l1-1, queue.length);
  } else {
     Expect.isFalse(expected);
     Expect.equals(l1, queue.length);
  }
}

test(Queue create([Iterable content])) {
  check([], 1, false);
  check([1], 1, true);
  check(new List.from([]), true, false);
  List a=new List();
  check(a, 2, false);
  a.add(2);
  check(a, 2, true);
  check(a, 2, false);
}

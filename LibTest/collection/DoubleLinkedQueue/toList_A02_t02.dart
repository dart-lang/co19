/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<E> toList({bool growable: true})
 * The list is fixed-length if [growable] is [false].
 * @description Checks that the list created with growable == false cannot
 * change its size.
 * @author kaigorodov
 */

import "dart:collection";
import "../../../Utils/expect.dart";

List<String> failures=new List<String>();
 
check(List l) {
  Expect.throws (() {
    l.clear();
    failures.add("clear");
  }, (e) => e is UnsupportedError);

  Expect.throws (() {
    l.length = 123;
    failures.add("set length");
  }, (e) => e is UnsupportedError);

  Expect.throws (() {
    l.add(null);
    failures.add("add");
  }, (e) => e is UnsupportedError);

  Expect.throws (() {
    l.removeLast();
    failures.add("removeLast");
  }, (e) => e is UnsupportedError);

  Expect.throws (() {
    l.removeRange(0,1);
    failures.add("removeRange");
  }, (e) => e is UnsupportedError);
}

main() {
  check(new DoubleLinkedQueue().toList(growable:false));
  DoubleLinkedQueue src = new DoubleLinkedQueue.from(
      [null, [null], [], [1,2,3], [[null]]]);
  check(src.toList(growable:false));
  if (failures.isEmpty) return;
  StringBuffer sb = new StringBuffer();
  sb.write(
      "following operations do not cause UnsupportedError on fixed-sized list:\n");
  sb.writeAll(failures, ", ");
  Expect.fail(sb.toString());
}

/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<E> toList({bool growable: true})
 * The list is fixed-length if [growable] is [false].
 * @description Checks that the list created with [growable == false] cannot
 * change its size.
 * @author iarkh@unipro.ru
 */

import "dart:collection";
import "../../../Utils/expect.dart";

class MyIterable<int> extends Object with IterableMixin {
  List _content;
  MyIterable(List list): _content = list;

  Iterator get iterator {
    return _content.iterator;
  }
}

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
  check(new MyIterable([]).toList(growable:false));
  IterableMixin src = new MyIterable(
      [null, [null], [], [1,2,3], [[null]]]);
  check(src.toList(growable:false));
  if (failures.isEmpty) return;
  StringBuffer sb = new StringBuffer();
  sb.write(
      "Operations do not cause UnsupportedError on fixed-sized list:\n");
  sb.writeAll(failures, ", ");
  Expect.fail(sb.toString());
}

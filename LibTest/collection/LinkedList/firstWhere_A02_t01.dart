/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion dynamic firstWhere(bool test(E value), {Object orElse()})
 * If no element satisfies [test], the result of invoking the [orElse] function
 * is returned.
 * @description Checks that the result of invoking the [orElse\ function is
 * returned when none matches [test].
 * @author kaigorodov
 */
import "dart:collection";
import "../../../Utils/expect.dart";
import "LinkedList.lib.dart";

class TestException {}

check(List list0) {
  LinkedList<MyLinkedListEntry> list = toLinkedList(list0);
  Expect.throws(() {
      list.firstWhere((MyLinkedListEntry entry) => false,
          orElse: (){ throw new TestException(); });
    },
    (e) => e is TestException
  );
}

main() {
  check(new List());
  check([]);
  check(const[]);
  check(new List.from([]));
  check([1, 2, 3]);
}

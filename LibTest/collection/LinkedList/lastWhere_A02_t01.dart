/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion dynamic lastWhere(bool test(E value), {Object orElse()})
 * If no element satisfies [test], the result of invoking the [orElse] function
 * is returned.
 * @description Checks that if none matches, the result of invoking the [orElse]
 * function is returned.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";
import "dart:collection";
import "LinkedList.lib.dart";

var noneMatches = new MyLinkedListEntry(new Object());

void check(LinkedList<MyLinkedListEntry> a, var element) {
  Expect.identical(noneMatches,
    a.lastWhere(
      (MyLinkedListEntry entry) => entry.value == element,
      orElse: () => noneMatches)
    );
}

main() {
  LinkedList a = toLinkedList([42, 0, -1, 42, -1, 6031769, 0]);
  check(a, 43);
  check(a, 2);
  check(a, -2);
  check(a, 6031768);
}

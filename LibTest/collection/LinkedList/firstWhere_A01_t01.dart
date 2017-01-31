/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion dynamic firstWhere(bool test(E value), {Object orElse()})
 * Returns the first element that satisfies the given predicate [test].
 * Iterates through elements and returns the first to satisfy [test].
 * @description Checks that the first element that satisfies the given predicate
 * [f] is returned.
 * @author kaigorodov
 */
import "dart:collection";
import "../../../Utils/expect.dart";
import "LinkedList.lib.dart";

check(List a0, test(value), int expected) {
  LinkedList<MyLinkedListEntry> a = toLinkedList(a0);
  int actual = a.firstWhere((entry) => test(entry.value)).value;
  Expect.equals(expected, actual);
}

main() {
  check([1, 2, -3, 4], (value) => value > 1, 2);
  check(const[1, 2, -5, -6], (value) => value < 0, -5);
}

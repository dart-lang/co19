/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion dynamic lastWhere(bool test(E value), {Object orElse()})
 * If [orElse] is omitted, it defaults to throwing a [StateError].
 * @description Checks that if none matches and [orElse] is [null], a
 * [StateError] is thrown.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";
import "dart:collection";
import "LinkedList.lib.dart";

var noneMatches=new Object();

void check(LinkedList<MyLinkedListEntry> a, var element) {
  Expect.throws(() {
      a.lastWhere((MyLinkedListEntry entry) => entry.value == element);
    },
    (e)=> e is StateError
  );
}

main() {
  LinkedList a = toLinkedList([42, 0, -1, 42, -1, 6031769, 0]);
  check(a, 43);
  check(a, 2);
  check(a, -2);
  check(a, 6031768);
}

/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion dynamic firstWhere(bool test(E value), {Object orElse()})
 * If [orElse] is omitted, it defaults to throwing a [StateError].
 * @description Checks that a [StateError] is thrown when [orElse] is [null] and
 * none matches.
 * @author kaigorodov
 */
import "dart:collection";
import "../../../Utils/expect.dart";
import "LinkedList.lib.dart";

check(List list0) {
  LinkedList<MyLinkedListEntry> list = toLinkedList(list0);
    Expect.throws(() {
      list.firstWhere((MyLinkedListEntry entry) => false);
    },
    (e) => e is StateError
  );
}

main() {
  check(new List());
  check([]);
  check(const[]);
  check(new List.from([]));
  check([1, 2, 3]);
}

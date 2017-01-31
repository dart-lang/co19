/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final E current
 * Gets the current element in the iteration.
 * @description Checks that the current element in the iteration is returned.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";
import "dart:collection";
import "LinkedList.lib.dart";

void checkNext(List a0) {
  LinkedList a = toLinkedList(a0);
  Iterator<MyLinkedListEntry> it = a.iterator;
  var i = 0;
  while (it.moveNext()) {
    Expect.equals(it.current.value, a0[i]);
    Expect.identical(it.current, it.current);
    ++i;
  }
}

main() {
  checkNext([null, 0, "1", false]);
  checkNext(const [null, 0, "1", false]);

  List a = new List(17495);
  for (var i = 0; i < a.length; i++) {
    a[i] = a.length - i;
  }
  checkNext(a);

  List l = new List();
  l.addAll(["0", "1", "2", "3", "4", "5", 6, 7, 8, 9, null]);
  a = new List.from(l);
  checkNext(a);
}

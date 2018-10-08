/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable map(f(E element))
 * As long as the returned [Iterable] is not iterated over, the supplied
 * function [f] will not be invoked.
 * @description Checks that the supplied function [f] will not be invoked if the
 * returned [Iterable] is not iterated over.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";
import "dart:collection";
import "LinkedList.lib.dart";

bool invoked = false;

f(var element) {
  invoked = true;
  return element;
}

void check(List<int> a) {
  LinkedList<MyLinkedListEntry<int>> llist = toLinkedList(a);
  llist.map(f);
}

main() {
  List<int> a = new List<int>();
  check(a);
  a.add(22);
  check(a);
  a.add(11);
  check(a);
  a.add(11);
  check(a);
  for (int k = -100; k < 200; k++) {
    a.add(k);
  }
  check(a);
  Expect.isFalse(invoked);
}

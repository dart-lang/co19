/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable map(f(E element))
 * Returns a new lazy [Iterable] with elements that are created by calling [f]
 * on each [element] of this [Iterable] in iteration order.
 * @description Checks that the resulting [Iterable] contains all the results of
 * [f(element)].
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";
import "dart:collection";
import "LinkedList.lib.dart";

int f (MyLinkedListEntry<int> entry) {
  return entry.value + 2;
}
  
void checkResult(List<int> a) {
  LinkedList<MyLinkedListEntry<int>> llist = toLinkedList(a);
  int count = 0;
  Iterable<int> mapIter = llist.map(f);
  for (int el in mapIter) {
    Expect.equals(a[count] + 2, el);
    count++;
  }
  Expect.equals(a.length, count);
}

main() {
  List<int> a = new List<int>();
  checkResult(a);
  a.add(22);
  checkResult(a);
  a.add(11);
  checkResult(a);
  a.add(11);
  checkResult(a);
  for (int k = -100; k < 200; k++) {
    a.add(k);
  }
  checkResult(a);
}

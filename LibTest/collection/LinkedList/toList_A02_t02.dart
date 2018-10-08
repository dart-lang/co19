/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<E> toList({bool growable: true})
 * The list is fixed-length if [growable] is [false].
 * @description Checks that the list created with [growable == false] cannot
 * change its size.
 * @author kaigorodov
 */
import "LinkedList.lib.dart";

List<String> failures = new List<String>();
 
void check(List a0) {
  List<MyLinkedListEntry> l = toLinkedList(a0).toList(growable:false);
  try {
    l.clear();
    failures.add("clear");
  } on UnsupportedError catch (ok) {}
  try {
    l.add(null);
    failures.add("add");
  } on UnsupportedError catch (ok) {}
  try {
    l.removeLast();
    failures.add("removeLast");
  } on UnsupportedError catch (ok) {}
  try {
    l.removeRange(0,1);
    failures.add("removeRange");
  } on UnsupportedError catch (ok) {}
}

main() {
  check([]);
  check(["1", "2", "3", "4", "5"]);
  check([null, [null], [], [1, 2, 3], [[null]]]);
}

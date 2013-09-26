/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool remove(E entry)
 * Remove entry from the list. This is the same as calling entry.unlink().
 * If entry is not in the list, false is returned.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";
import "dart:collection";
import "LinkedList.lib.dart";

check(LinkedList<MyLinkedListEntry<Object>> llist, MyLinkedListEntry<Object> entry, bool expected) {
  var l1=llist.length;
  bool r = llist.remove(entry);
  if (expected) {
     Expect.isTrue(r);
     Expect.equals(l1-1, llist.length);
  } else {
     Expect.isFalse(r);
     Expect.equals(l1, llist.length);
  }
}

main() {
  LinkedList<MyLinkedListEntry<Object>> a = new LinkedList<MyLinkedListEntry<Object>>();
  check(a, new MyLinkedListEntry<Object>(2), false);
  MyLinkedListEntry<Object> entry=new MyLinkedListEntry<Object>(2);
  a.add(entry);
  check(a, entry, true);
  check(a, entry, false);
}

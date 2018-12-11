/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool remove(E entry)
 * Remove [entry] from the linked list.
 * @description Checks that [remove] does not break iteration order of the
 * linked list.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";
import "LinkedList.lib.dart";

check(LinkedList<MyLinkedListEntry> llist,
    MyLinkedListEntry<Object> entry) {
  List initial = llist.toList();

  llist.remove(entry);

  int i = 0;
  llist.forEach((MyLinkedListEntry elem) {
    if(initial[i] == entry) {
      i++;
    };
    Expect.equals(initial[i++], elem);
  });
}

main() {
  LinkedList<MyLinkedListEntry> a = new LinkedList<MyLinkedListEntry>();
  MyLinkedListEntry entry = new MyLinkedListEntry(2);
  a.add(entry);
  check(a, entry);

  a.add(new MyLinkedListEntry(28));
  a.add(new MyLinkedListEntry(2));
  a.add(new MyLinkedListEntry(2));
  a.add(entry);
  a.add(new MyLinkedListEntry(-11));
  a.add(new MyLinkedListEntry(0));
  check(a, entry);

  a.add(entry);
  check(a, entry);
}

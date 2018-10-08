/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void addFirst(E entry)
 * Add [entry] to the beginning of the list.
 * @description Checks that [entry] is added to the beginning of the list.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";
import "dart:collection";
import "LinkedList.lib.dart";

main() {
  LinkedList<MyLinkedListEntry> list = new LinkedList<MyLinkedListEntry>();
  
  list.addFirst(new MyLinkedListEntry(1));
  Expect.equals(1, list.first.value);
  
  list.addFirst(new MyLinkedListEntry(null));
  Expect.equals(null, list.first.value);
  
  list.addFirst(new MyLinkedListEntry(list));
  Expect.equals(list, list.first.value);

  list.clear();
  for (var i = 0; i <= 1000; i++) {
    list.addFirst(new MyLinkedListEntry(i));
    Expect.equals(i, list.first.value);
    Expect.equals(i + 1, list.length);
  }
}

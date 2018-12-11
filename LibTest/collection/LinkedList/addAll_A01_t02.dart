/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void addAll(Iterable<E> entries)
 * Add [entries] to the end of the list.
 * @description Checks that method does not affect the previous content of the
 * list
 * @author kaigorodov
 */
import "dart:collection";
import "LinkedList.lib.dart";

main() {
  LinkedList<MyLinkedListEntry> a = toLinkedList(["1", "2", "3"]);
  contentEquals(["1", "2", "3"], a);

  a.addAll([null, 0, false, "0"]
      .map((var element) => new MyLinkedListEntry(element)));
  contentEquals(["1", "2", "3", null, 0, false, "0"], a);
}

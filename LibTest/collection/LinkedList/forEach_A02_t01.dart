/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void forEach(void action(E entry))
 * It's an error if [action[ modify the linked list.
 * @description Checks that it's an error if [action] modifies the list.
 * @author kaigorodov
 */
import "dart:collection";
import "../../../Utils/expect.dart";
import "LinkedList.lib.dart";

LinkedList<MyLinkedListEntry> list = toLinkedList([1, 2]);

main() {
  Expect.throws(() => list.forEach(
    (MyLinkedListEntry entry) {
      list.remove(entry);
    }
  ));

  Expect.throws(() => list.forEach(
    (MyLinkedListEntry entry) {
      entry.unlink();
    }
  ));
}

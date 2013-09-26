/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void forEach(void action(E entry))
 * It's an error if action modify the list.
 * @description Checks that it's an error if action modify the list.
 * @author kaigorodov
 * @issue  13571
 */
import "dart:collection";
import "../../../Utils/expect.dart";
import "LinkedList.lib.dart";

LinkedList list=toLinkedList([1]);

main() {
  print("isEmpty=${list.isEmpty}");
  Expect.throws(() => list.forEach(
    (MyLinkedListEntry entry) {
      list.remove(entry);
    }
  ));
  print("isEmpty=${list.isEmpty}");
  Expect.throws(() => list.forEach(
    (MyLinkedListEntry entry) {
      entry.unlink();
    }
  ));
  print("isEmpty=${list.isEmpty}");
}

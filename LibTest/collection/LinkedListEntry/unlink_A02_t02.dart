/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void unlink()
 * ...
 * The entry must currently be in a linked list when this method is called.
 * @description Checks that the entry must not be already unlinked
 * @author sgrekhov@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";
import "LinkedListEntry.lib.dart";

main() {
  LinkedList<MyLinkedListEntry> list = new LinkedList<MyLinkedListEntry<int>>();
  MyLinkedListEntry<int> entry = new MyLinkedListEntry<int>(1);
  list.add(entry);
  entry.unlink();
  Expect.throws(() {entry.unlink();});
}

/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract class LinkedListEntry<E extends LinkedListEntry>
 * An object that can be an element in a [LinkedList].
 * All elements of a [LinkedList] must extend this class.
 * @description Checks that only [LinkedListEntry] can be an instance of
 * [LinkedList]
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";
import "LinkedListEntry.lib.dart";

main() {
  MyLinkedListEntry entry = new MyLinkedListEntry(1);
  LinkedList<MyLinkedListEntry> list = new LinkedList<MyLinkedListEntry>();
  list.add(entry);
  Expect.throws(() { list.add(1 as dynamic); });
}

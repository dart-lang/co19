/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion class LinkedList<E extends LinkedListEntry>
 * A specialized double-linked list of elements that extends [LinkedListEntry]
 * This is not a generic data structure. It only accepts elements that extend
 * the [LinkedListEntry] class.
 * @description Checks that [LinkedList] accepts [LinkedListEntry] elements and
 * does not accept any other classes.
 * @author iarkh@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";
import "LinkedList.lib.dart";

main() {
  LinkedList<MyLinkedListEntry> list = new LinkedList<MyLinkedListEntry>();
  list.add(new MyLinkedListEntry(1));
  Expect.throws(() { list.add(1 as dynamic); });
  Expect.throws(() { list.add(new Object() as dynamic); });
  Expect.throws(() { list.add("test" as dynamic); });
  Expect.throws(() { list.add(null); });
}

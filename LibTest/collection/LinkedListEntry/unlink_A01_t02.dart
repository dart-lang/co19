// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion void unlink()
/// Unlink the element from its linked list.
/// @description Checks that the element is removed from the list. Try to remove
/// the first element of the list
/// @author sgrekhov@unipro.ru

import "../../../Utils/expect.dart";
import "dart:collection";
import "LinkedListEntry.lib.dart";

main() {
  LinkedList<MyLinkedListEntry> list = new LinkedList<MyLinkedListEntry<int>>();
  MyLinkedListEntry<int> entry1 = new MyLinkedListEntry<int>(1);
  MyLinkedListEntry<int> entry2 = new MyLinkedListEntry<int>(2);
  MyLinkedListEntry<int> entry3 = new MyLinkedListEntry<int>(2);
  list.add(entry1);
  list.add(entry2);
  list.add(entry3);
  entry1.unlink();

  Expect.isNull(entry1.list);
  Expect.isNull(entry1.next);
  Expect.isNull(entry1.previous);
  Expect.identical(entry2, list.first);
}

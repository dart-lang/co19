/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void add(E entry)
 * Add [entry] to the end of the list.
 * @description Checks that method does not affect the existing content of the
 * list
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";
import "dart:collection";
import "LinkedList.lib.dart";

main() {
  LinkedList<MyLinkedListEntry> a = new LinkedList<MyLinkedListEntry>();
  Expect.isTrue(a.length == 0);
  a.add(new MyLinkedListEntry(null));
  contentEquals([null], a);
  a.add(new MyLinkedListEntry(0));
  contentEquals([null, 0], a);
  a.add(new MyLinkedListEntry("1"));
  contentEquals([null, 0, "1"], a);
}

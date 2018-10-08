/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract bool moveNext()
 * Returns whether the [Iterator] has elements left.
 * @description Checks that [true] is returned only if the [Iterator] has
 * elements left.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";
import "dart:collection";
import "LinkedList.lib.dart";

main() {
  Expect.isFalse(toLinkedList([]).iterator.moveNext());

  LinkedList<MyLinkedListEntry> a = new LinkedList<MyLinkedListEntry>();
  Expect.isFalse(a.iterator.moveNext());
  a.add(new MyLinkedListEntry(0));
  Iterator it = a.iterator;
  Expect.isTrue(it.moveNext());
  Expect.isFalse(it.moveNext());

  a = new LinkedList<MyLinkedListEntry>();
  it = a.iterator;
  Expect.isFalse(it.moveNext());

  a = toLinkedList(const[]);
  it = a.iterator;
  Expect.isFalse(it.moveNext());

  a = toLinkedList(const[1]);
  it = a.iterator;
  Expect.isTrue(it.moveNext());
}

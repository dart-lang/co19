/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by list
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool any(bool f(E element))
 * Returns true if one element of this collection satisfies the predicate test.
 * Returns false otherwise.
 * @description Checks that true is returned if one or more elements satisfies
 * the predicate f, false otherwise.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";
import "dart:collection";
import "LinkedList.lib.dart";

bool isOne (MyLinkedListEntry element) => element.value==1;

main() {
  LinkedList<MyLinkedListEntry> list = new LinkedList<MyLinkedListEntry>();
  Expect.isFalse(list.any(isOne));
  list.add(new MyLinkedListEntry(2));
  Expect.isFalse(list.any(isOne));
  list.add(new MyLinkedListEntry(1));
  Expect.isTrue(list.any(isOne));
  list.add(new MyLinkedListEntry(1));
  Expect.isTrue(list.any(isOne));
}

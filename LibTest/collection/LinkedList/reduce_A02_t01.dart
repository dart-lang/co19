/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E reduce(E combine(E value, E element))
 * The iterable must have at least one element.
 * @description Checks that [StateError] is thrown if given list is empty.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";
import "LinkedList.lib.dart";

check(combine) {
  LinkedList<MyLinkedListEntry<int>> list = toLinkedList([]);
  MyLinkedListEntry<int> combine2(
      MyLinkedListEntry<int> value, MyLinkedListEntry<int> element) =>
      new MyLinkedListEntry<int>(combine(value.value, element.value));
  Expect.throws(() { list.reduce(combine2).value; }, (e) => e is StateError);
}

main() {
  check((value, element) => value + element);
  check((value, element) => 10);
}

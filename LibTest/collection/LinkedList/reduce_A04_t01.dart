/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E reduce(E combine(E value, E element))
 * Otherwise this method starts with the first element from the iterator, and
 * then combines it with the remaining elements in iteration order.
 * @description Checks that elements are combined in iteration order.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";
import "LinkedList.lib.dart";

check(List<String> a, combine, String expected) {
  LinkedList<MyLinkedListEntry<String>> llist = toLinkedList(a);
  MyLinkedListEntry<String> combine2(
      MyLinkedListEntry<String> value, MyLinkedListEntry<String> element) =>
        new MyLinkedListEntry<String>(combine(value.value, element.value));
  String actual = llist.reduce(combine2).value;
  Expect.equals(expected, actual);
}	

main() {
  check(["1", "2", "-3"], (value, element) => value + element, "12-3");
  check(["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n"],
      (value, element) => value + element, "abcdefghijklmn");
  check(["test", " ", "me", " ", "now", "!"],
      (value, element) => value + element, "test me now!");
}

/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final bool isNotEmpty
 * Returns [true] if there is at least one element in this collection.
 * @description Checks various lists, that the method returns [false] if there
 * is no elements in the list, [true] otherwise.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";
import "LinkedList.lib.dart";

main() {
  Expect.isFalse(toLinkedList([]).isNotEmpty);
  Expect.isTrue(toLinkedList([null]).isNotEmpty);
  Expect.isTrue(toLinkedList(const[0, 1, 2, 3, 4]).isNotEmpty);
  Expect.isTrue(toLinkedList([[]]).isNotEmpty);

  Expect.isFalse(toLinkedList(new List.from([])).isNotEmpty);
  Expect.isTrue(toLinkedList(new List.from([[]])).isNotEmpty);

  List a = new List(0);
  Expect.isFalse(toLinkedList(a).isNotEmpty);
  a = new List(469);
  Expect.isTrue(toLinkedList(a).isNotEmpty);
}

/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  final bool isEmpty
 * Returns [true] if there is no element in this collection.
 * @description Checks various lists, that the method returns [true] if there is
 * no elements in the list, [alse] otherwise.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";
import "LinkedList.lib.dart";

main() {
  Expect.isTrue(toLinkedList([]).isEmpty);
  Expect.isFalse(toLinkedList([null]).isEmpty);
  Expect.isFalse(toLinkedList(const[0, 1, 2, 3, 4]).isEmpty);
  Expect.isFalse(toLinkedList([[]]).isEmpty);

  Expect.isTrue(toLinkedList(new List.from([])).isEmpty);
  Expect.isFalse(toLinkedList(new List.from([[]])).isEmpty);

  List a = new List(0);
  Expect.isTrue(toLinkedList(a).isEmpty);
  a = new List(469);
  Expect.isFalse(toLinkedList(a).isEmpty);
}

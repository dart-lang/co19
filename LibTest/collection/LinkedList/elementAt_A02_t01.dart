/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E elementAt(int index)
 * The [index] must be non-negative and less than length.
 * @description Checks that a [RangeError] is thrown if this list has fewer than
 * [index] elements.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";
import "dart:collection";
import "LinkedList.lib.dart";

var v;

void check (LinkedList a, int index) {
  Expect.throws(() { a.elementAt(index); }, (e) => e is RangeError);
}

main() {
  LinkedList a=toLinkedList([5, 4, 3, 2, 1, 0]);
  check(a, -1);
  check(a, a.length);
  check(a, a.length + 1);
  check(a, a.length * 2);
  check(a, 1000000000);
}

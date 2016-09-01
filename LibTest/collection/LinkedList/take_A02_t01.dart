/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> take(int n)
 * Returns an Iterable with at most n elements.
 * The returned Iterable may contain fewer than n elements, if this contains fewer than n elements.
 * It is an error if n is negative.
 * @description checks that some error is thrown if n is negative.
 * @author kaigorodov
 */
import "dart:collection";
import "../../../Utils/expect.dart";
import "LinkedList.lib.dart";

check(List a0, int n) {
  LinkedList<MyLinkedListEntry<int>> a=toLinkedList(a0);
  Expect.throws(() {
      a.take(n);
    }
  );
}

main() {
  check([1,2,-3,4], -1);
  check(const[1,2,-5,-6, 100], -2);
  check(const[null,2,-5,-6, 100], -1000);
}
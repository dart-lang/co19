/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertionIterable expand(Iterable f(E element))
 * The returned [Iterable] is lazy, and calls [f] for each element of this every
 * time it's iterated.
 * @description Checks that the returned [Iterable] is lazy.
 * @author kaigorodov
 */
import "dart:collection";
import "LinkedList.lib.dart";

void check(List a0) {
  LinkedList<MyLinkedListEntry> a = toLinkedList(a0);
  a.expand((var element) {
    throw new Exception("should not be called");
  });
}

main() {
  List a = new List();
  check(a);
  a.add(2);
  check(a);
  a.add(1);
  check(a);
  a.add(1);
  check(a);
}

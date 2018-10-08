/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertionIterable expand(Iterable f(E element))
 * Expands each element of this [Iterable] into zero or more elements.
 * The resulting [Iterable] runs through the elements returned by [f] for each
 * element of this, in iteration order.
 * @description Checks that the function [f] is called for every element of the
 * list.
 * @author kaigorodov
 */
import "dart:collection";
import "../../../Utils/expect.dart";
import "LinkedList.lib.dart";

void checkCount(List a0) {
  LinkedList<MyLinkedListEntry> a = toLinkedList(a0);
  int count = 0;
  Iterable expanded = a.expand((MyLinkedListEntry element) {
    Expect.equals(a0[count], element.value);
    count++;
    return [element];
  });
  Expect.equals(a0.length, expanded.length);
}

main() {
  List a = new List();
  checkCount(a);
  a.add(22);
  checkCount(a);
  a.add(11);
  checkCount(a);
  a.add(11);
  checkCount(a);
}

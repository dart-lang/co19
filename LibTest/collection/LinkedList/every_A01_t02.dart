/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool every(bool f(E element))
 * Checks every element in iteration order, and returns [false] if any of them
 * make [test] return [false], otherwise returns [true].
 * @description Checks that the predicate method is called for each element
 * until the first [false] result.
 * @author kaigorodov
 */
import "dart:collection";
import "../../../Utils/expect.dart";
import "LinkedList.lib.dart";

//Checks that [every] calls [predicate] a [count] number of times
check(LinkedList<MyLinkedListEntry> a, bool predicate(var e), int count) {
  int actualCount = 0;
  a.every((MyLinkedListEntry e) {
    actualCount++;
    return predicate(e.value);
  });
  Expect.equals(count, actualCount);
}

bool allTrue(var e) => true;

bool allFalse(var e) => false;

bool lessThan3(var e) => e < 3;
  
main() {
  LinkedList<MyLinkedListEntry> a = toLinkedList([1, 2, 3, 4, 5]);
  check(a, allTrue, 5);
  check(a, allFalse, 1);
  check(a, lessThan3, 3);
}

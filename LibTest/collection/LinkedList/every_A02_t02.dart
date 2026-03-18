// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion bool every(bool f(E element))
/// @description Checks that [f] is not called if list is empty
/// @author kaigorodov

import "dart:collection";
import "../../../Utils/expect.dart";
import "LinkedList.lib.dart";

//Checks that [every] calls [predicate] a [count] number of times
check(LinkedList<MyLinkedListEntry> a, bool predicate(dynamic e)) {
  int actualCount = 0;
  a.every((MyLinkedListEntry e) {
    actualCount++;
    return predicate(e.value);
  });
  Expect.equals(0, actualCount);
}

bool allTrue(e) => true;

bool allFalse(e) => false;

bool lessThan3(e) => e < 3;
  
main() {
  LinkedList<MyLinkedListEntry> a = new  LinkedList<MyLinkedListEntry>();
  check(a, allTrue);
  check(a, allFalse);
  check(a, lessThan3);
}

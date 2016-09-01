/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E singleWhere(bool test(E value))
 * If no or more than one element match then a StateError is thrown.
 * @description Checks that a StateError is thrown if more than one element match.
 * @author kaigorodov
 */
import "dart:collection";
import "../../../Utils/expect.dart";
import "LinkedList.lib.dart";

check(List a0, test(value)) {
  LinkedList<MyLinkedListEntry<int>> a=toLinkedList(a0);
  bool test2(MyLinkedListEntry<int> value) =>
    test(value.value);
  Expect.throws(() {
      a.singleWhere(test2);
    },
    (e) => e is StateError
  );
}

main() {
  check(const[1,2,-5,-6,1], (value)=>value==1);
  check([1,2,-3,4,-1], (value)=>value<0);
}

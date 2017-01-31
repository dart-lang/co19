/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final E last
 * If this is empty throws a StateError.
 * @description Checks that [StateError] is thrown if the list is empty.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";
import "dart:collection";
import "LinkedList.lib.dart";

check(List a0) {
  LinkedList a = toLinkedList(a0);
  Expect.throws(() {
      a.last;
    },
    (e) => e is StateError
  );
}

main() {
  check(new List());
  check([]);
  check(const[]);
  check(new List.from([]));
}

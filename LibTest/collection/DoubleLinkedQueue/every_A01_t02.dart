/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool every(bool f(E element))
 * Returns true if every elements of this collection satisfy the predicate test.
 * Returns false otherwise.
 * @description Checks that every() on empty list returns true.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  DoubleLinkedQueue list = new DoubleLinkedQueue();
  
  int count = 0;
  bool res = list.every((var element) {
    count++;
    return false;
  });
  
  Expect.isTrue(count == 0);
  Expect.isTrue(res == true);
}

/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool every(bool f(E element))
 * Checks whether every element of this iterable satisfies [test].
 * Checks every element in iteration order, and returns [false] if any of them
 * make [test] return [false], otherwise returns [true].
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

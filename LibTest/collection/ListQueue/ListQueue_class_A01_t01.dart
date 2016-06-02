/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Queue<E> abstract class 
 * Implements Queue<E>
 * @description Checks that all members of [Queue] are implemented.
 * @author kaigorodov
 */
import "dart:collection";
import "../Queue/all_tests.lib.dart" as allQueueTests;

ListQueue create([Iterable content]) {
  if (content == null) {
    return new ListQueue();
  } else {
    return new ListQueue.from(content);
  }
}  

main() {
  allQueueTests.test(create);
}

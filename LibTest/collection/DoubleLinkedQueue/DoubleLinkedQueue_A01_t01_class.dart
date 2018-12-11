/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Queue<E> abstract class
 * Implements Queue<E>
 * @description Checks that all members of [Queue] are implemented.
 * @issue 26587
 * @author kaigorodov
 */
import "dart:collection";
import "../Queue/all_tests.lib.dart";

DoubleLinkedQueue create([Iterable content]) {
  DoubleLinkedQueue res = new DoubleLinkedQueue();
  if (content != null) {
    res.addAll(content);
  }
  return res;
}

main() {
  test(create);
}

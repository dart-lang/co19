/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Queue<E> abstract class 
 * Implements Iterable<E>
 * @description Checks that all members of [Iterable] are implemented.
 * @author kaigorodov
 */
library allQueueTests;

import "dart:collection";
import "../../core/Iterable/allTests.lib.dart" as libIterable;
import "add_A01_t01.test.dart" as add_A01_t01;
import "add_A01_t02.test.dart" as add_A01_t02;
import "addAll_A01_t01.test.dart" as addAll_A01_t01;
import "addAll_A01_t02.test.dart" as addAll_A01_t02;
import "addAll_A02_t01.test.dart" as addAll_A02_t01;
import "addAll_A03_t01.test.dart" as addAll_A03_t01;
import "addFirst_A01_t01.test.dart" as addFirst_A01_t01;
import "addFirst_A01_t02.test.dart" as addFirst_A01_t02;
import "addLast_A01_t01.test.dart" as addLast_A01_t01;
import "addLast_A01_t02.test.dart" as addLast_A01_t02;
import "clear_A01_t01.test.dart" as clear_A01_t01;
import "remove_A01_t01.test.dart" as remove_A01_t01;
import "removeFirst_A01_t01.test.dart" as removeFirst_A01_t01;
import "removeFirst_A02_t01.test.dart" as removeFirst_A02_t01;
import "removeLast_A01_t01.test.dart" as removeLast_A01_t01;
import "removeLast_A02_t01.test.dart" as removeLast_A02_t01;
import "removeWhere_A01_t01.test.dart" as removeWhere_A01_t01;
import "removeWhere_A02_t01.test.dart" as removeWhere_A02_t01;
import "removeWhere_A02_t02.test.dart" as removeWhere_A02_t02;
import "retainWhere_A01_t01.test.dart" as retainWhere_A01_t01;
import "retainWhere_A02_t01.test.dart" as retainWhere_A02_t01;
import "retainWhere_A02_t02.test.dart" as retainWhere_A02_t02;

test(Queue create([Iterable content]), {bool isSet : false}) {
  libIterable.test(create, isSet : false);
  add_A01_t01.test(create);
  add_A01_t02.test(create);
  addAll_A01_t01.test(create);
  addAll_A01_t02.test(create);
  addAll_A02_t01.test(create);
  addAll_A03_t01.test(create);
  addFirst_A01_t01.test(create);
  addFirst_A01_t02.test(create);
  addLast_A01_t01.test(create);
  addLast_A01_t02.test(create);
  clear_A01_t01. test(create);
  remove_A01_t01.test(create);
  removeFirst_A01_t01.test(create);
  removeFirst_A02_t01.test(create);
  removeLast_A01_t01.test(create);
  removeLast_A02_t01.test(create);
  removeWhere_A01_t01.test(create);
  removeWhere_A02_t01.test(create);
  removeWhere_A02_t02.test(create);
  retainWhere_A01_t01.test(create);
  retainWhere_A02_t01.test(create);
  retainWhere_A02_t02.test(create);
}

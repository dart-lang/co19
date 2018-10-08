/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An entry in a doubly linked list. It contains a pointer to
 * the next entry, the previous entry, and the boxed element.
 *
 * @description Checks methods and properties inherited from Object: hashCode,
 * equality operator, toString, runtimeType
 *
 * @author a.semenov@unipro.ru
 */
import "dart:collection";
import "../../core/Object/allTests.lib.dart" as object;

int value = 0;

Object create() => new DoubleLinkedQueueEntry(value++);

List<Object> createEqual(int number) =>
  new List.filled(number, new DoubleLinkedQueueEntry(value++), growable:false);

List<Object> createNotEqual(int number) =>
  new List.generate(number,
                    (_) => new DoubleLinkedQueueEntry(value++),
                    growable:false);

main() {
  object.test(create, createEqual, createNotEqual);
}

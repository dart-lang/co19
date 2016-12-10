/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * HashMap.fromIterable(Iterable iterable, {K key(element), V value(element)})
 * For each element of the iterable this constructor computes a key/value pair,
 * by applying key and value respectively.
 * @description Checks that created hash map contains all elements of the
 * iteratable with key/values according functions specified
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  DoubleLinkedQueue queue = new DoubleLinkedQueue();
  queue.add(1);
  queue.add(2);
  queue.add(3);
  queue.add('a');
  queue.add('b');
  queue.add('c');
  queue.add(null);

  HashMap map = new HashMap.fromIterable(
      queue, key: (el) => 'key' + el.toString(),
      value: (el) => 'val' + el.toString());
  Expect.equals(queue.length, map.length);
  queue.forEach((el) {
    Expect.equals('val' + el.toString(), map['key' + el.toString()]);
  });
}

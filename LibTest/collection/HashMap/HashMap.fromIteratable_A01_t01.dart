/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * HashMap.fromIterable(Iterable iterable, {K key(element), V value(element)})
 * Creates a HashMap where the keys and values are computed from the iterable.
 * For each element of the iterable this constructor computes a key/value pair,
 * by applying key and value respectively.
 * The keys of the key/value pairs do not need to be unique. The last occurrence
 * of a key will simply overwrite any previous value.
 * If no values are specified for key and value the default is the identity
 * function.
 * @description Checks that created hash map contains all elements of the
 * iteratable
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  DoubleLinkedQueue queue = new DoubleLinkedQueue();
  queue.add(1);
  queue.add(2);
  queue.add(3);
  queue.add(null);

  HashMap map = new HashMap.fromIterable(queue);
  Expect.equals(queue.length, map.length);
  queue.forEach((el) {
    Expect.equals(el, map[el]);
  });
}

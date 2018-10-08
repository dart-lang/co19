/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * HashMap.fromIterable(Iterable iterable, {K key(element), V value(element)})
 * The keys of the key/value pairs do not need to be unique. The last occurrence
 * of a key will simply overwrite any previous value.
 * @description Checks that if key/value pairs are not unique then the last
 * occurrence overwrites any previous value
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  DoubleLinkedQueue queue = new DoubleLinkedQueue();
  queue.add(1);
  queue.add(2);
  queue.add(3);
  queue.add(4);
  queue.add(5);
  queue.add(6);

  HashMap map = new HashMap.fromIterable(queue,
      key: (el) => 'key' + (el % 2).toString(),
      value: (el) => 'val' + el.toString());
  Expect.equals(2, map.length);
  Expect.equals('val5', map['key1']);
  Expect.equals('val6', map['key0']);
}

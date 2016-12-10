/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion HashMap.fromIterables(Iterable<K> keys, Iterable<V> values)
 * If [keys] contains the same object multiple times, the last occurrence
 * overwrites the previous value.
 * @description Checks that if keys contains the same object several times then
 * the last occurrence overrides the previous value
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  DoubleLinkedQueue keys = new DoubleLinkedQueue();
  keys.add(1);
  keys.add(2);
  keys.add(2);
  keys.add(2);
  DoubleLinkedQueue values = new DoubleLinkedQueue();
  values.add('val1');
  values.add('val2');
  values.add('val3');
  values.add('val4');

  HashMap map = new HashMap.fromIterables(keys, values);
  Expect.equals(2, map.length);
  Expect.equals('val1', map[1]);
  Expect.equals('val4', map[2]);
}

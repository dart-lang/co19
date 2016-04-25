/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion HashMap.fromIterables(Iterable<K> keys, Iterable<V> values)
 * Creates a HashMap associating the given keys to values.
 * This constructor iterates over keys and values and maps each element of keys
 * to the corresponding element of values.
 * If keys contains the same object multiple times, the last occurrence
 * overwrites the previous value.
 * It is an error if the two Iterables don't have the same length.
 * @description Checks that if two Iterables don't have the same length an error
 * occurs. Test the case when keys are shorter
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  DoubleLinkedQueue keys = new DoubleLinkedQueue();
  keys.add(1);
  keys.add(2);
  keys.add(3);
  DoubleLinkedQueue values = new DoubleLinkedQueue();
  values.add('val1');
  values.add('val2');
  values.add('val3');
  values.add('val4');

  Expect.throws(() {new HashMap.fromIterables(keys, values);});
}

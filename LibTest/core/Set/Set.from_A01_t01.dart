/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Set.from(Iterable<E> other)
 * Creates a [Set] that contains all elements of [other].
 * @description Checks that created set contains all elements of [other].
 * Both empty and non-empty argument collections are tested.
 * @author rodionov
 */
import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  Set<int> set = new Set.from([1, 2, 3, 4, 5]);
  Expect.setEquals(set, [1, 2, 3, 4, 5]);
  
  Queue  q = new Queue.from([1, 2, 3, 4, 5]);
  set = new Set.from(q);
  Expect.setEquals(set, q);
  
  Set tmp = new Set();
  tmp.add(1);
  tmp.add(2);
  set = new Set.from(tmp);
  Expect.setEquals(set, tmp);
  
  set = new Set.from(new Set());
  Expect.setEquals(set, []);
  
  set = new Set.from([]);
  Expect.setEquals(set, []);
  
  set = new Set.from(new Set());
  Expect.setEquals(set, []);
}

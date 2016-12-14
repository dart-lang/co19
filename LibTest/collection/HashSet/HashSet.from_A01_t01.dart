/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion interface HashSet.from(Iterable elements)
 * Create a hash set containing all [elements].
 * @description Checks that created hash set contains all elements of [elements].
 * Both empty and non-empty argument collections are tested.
 * @author rodionov
 */
import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  HashSet<int> set = new HashSet.from([1, 2, 3, 4, 5]);
  Expect.setEquals(set, [1, 2, 3, 4, 5]);
  
  Queue q = new Queue.from([1, 2, 3, 4, 5]);
  set = new HashSet.from(q);
  Expect.setEquals(set, q);
  
  HashSet tmp = new HashSet();
  tmp.add(1);
  tmp.add(2);
  set = new HashSet.from(tmp);
  Expect.setEquals(set, tmp);
  
  set = new HashSet.from(new Set());
  Expect.setEquals(set, []);
  
  set = new HashSet.from([]);
  Expect.setEquals(set, []);
  
  set = new HashSet.from(new HashSet());
  Expect.setEquals(set, []);
}

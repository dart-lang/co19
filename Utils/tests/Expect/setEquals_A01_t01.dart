/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion static void setEquals(Iterable expected, Iterable actual, [String reason = null])
 * Checks that every element of [expected] is also in [actual], and that every element of [actual] is also in [expected].  
 * @description Checks that no exception is thrown when the compared Iterables have equal contents,
 *              regardless of their order and reason (the last argument).
 * @author rodionov
 * @reviewer varlax
 */
import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  Expect.setEquals([1,2,3], [2,3,1]);
  Expect.setEquals([], []);

  Expect.setEquals(new Set.from([0, 235892385, "abracadabra"]), [ 235892385, "abracadabra", 0]);

  Expect.setEquals(new Set.from([0, 235892385, "abracadabra"]),
      new Queue.from([0, 235892385, "abracadabra"]));
  Expect.setEquals(new Set.from([0, 235892385, "abracadabra"]), 
      new Queue.from([0, 235892385, "abracadabra"]), "");
  Expect.setEquals(new Set.from([0, 235892385, "abracadabra"]), 
      new Queue.from([0, 235892385, "abracadabra"]), "not empty");
}

/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion static void setEquals(Iterable expected, Iterable actual, [String reason = null])
 * Checks that every element of [expected] is also in [actual], and that every element of [actual] is also in [expected].  
 * @description Checks that using Iterables with non-equal contents results in ExpectException
 *              being thrown.
 * @author rodionov
 * @reviewer varlax
 */
import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  check([],[0]);

  check(new Set.from([0, 235892385, 1.2, "abracadabra"]), 
      [0, 235892385, 2.1, "abracadabra"]);
  check(new Set.from([0, 235892385, 23, "abracadabra"]), 
      [0, 235892385, .32, "abracadabra"], "");
  check(new Set.from([0, 235892385, '', "abracadabra"]), 
      [0, 235892385, 54, "abracadabra"], "not empty");
  
  check(new Set.from([double.nan]), [double.nan]);
  check(new Set.from([double.nan]), [double.nan], "");
  check(new Set.from([double.nan]), [double.nan], "not empty");

  check(new Queue.from([double.nan]), new Set.from([double.nan]));
  check(new Queue.from([double.nan]), new Set.from([double.nan]), "");
  check(new Queue.from([double.nan]), new Set.from([double.nan]), "not empty");
}

void check(Iterable arg1, Iterable arg2, [String reason = null]) {
  try {
    Expect.setEquals(arg1, arg2, reason);
    throw new Exception("ExpectException expected");
  } on ExpectException catch(e) {
  }
}

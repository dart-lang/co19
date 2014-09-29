/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion static void listEquals(List expected, List actual, [String reason = null])
 * Checks that all elements in [expected] and [actual] are equal [:==:].
 * @description Checks that using list with non-equal contents results in ExpectException
 *              being thrown.
 * @author rodionov
 * @reviewer varlax
 */
import "../../../Utils/expect.dart";

main() {
  check([], [null]);
  check([], [null], "");
  check([], [null], "not empty");

  check([1, 2], [2, 1]);
  check([1, 2], [2, 1], "");
  check([1, 2], [2, 1], "not empty");

  check([true], [1]);
  check([true], [1], "");
  check([true], [1], "not empty");

  check([1, new Object()], [1, new Object()]);
  check([1, new Object()], [1, new Object()], "");
  check([1, new Object()], [1, new Object()], "not empty");

  check([1,2,3],[1,2,3,4]);
  check([0,1,2,3],[1,2,3]);
}

void check(List arg1, List arg2, [String reason = null]) {
  try {
    Expect.listEquals(arg1, arg2, reason);
    throw new Exception("ExpectException expected");
  } on ExpectException catch(e) {
  }
}

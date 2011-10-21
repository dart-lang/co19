/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion static void listEquals(List expected, List actual, [String reason = null])
 * Descriptive error message is provided in case of failure.
 * @description Checks that message of thrown ExpectException includes 
 *              representation of the expected and mismatched elements, as well as the reason.
 * @author varlax
 */

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

  check([new Object()], [new Object()]);
  check([new Object()], [new Object()], "not empty");

  check([double.NAN], [double.NAN]);
  check([double.NAN], [double.NAN], "");
  check([double.NAN], [double.NAN], "not empty");

  check([1,2,3], [1,2,3,4]);
  check([0,1,2,3], [1,2,3], "235dsf435g gret sd");
}

void check(List arg1, List arg2, [String reason = null]) {
  try {
    Expect.listEquals(arg1, arg2, reason);
    throw new Exception("ExpectException expected");
  } catch (ExpectException e) {
    if(arg1.length !== arg2.length) {
      if(!e.message.contains(arg1.length.toString(), 0) && !e.message.contains(arg2.length.toString(), 0)) {
        throw "exception message (" + e.message + ") doesn't mention list lengths";
      }
    } else {
      var a1 = arg1[0], a2 = arg2[0];
      if (!e.message.contains(a1 !== null ? a1.toString() : "null", 0)) throw "no expected value";
      if (!e.message.contains(a2 !== null ? a2.toString() : "null", 0)) throw "no actual value";
      if (reason !== null && !reason.isEmpty() && !e.message.contains(reason, 0)) throw "no reason";
    }
  }
}
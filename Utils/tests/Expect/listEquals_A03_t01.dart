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
 * @reviewer msyabro
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

  check([new Object()], [new Object()]);
  check([new Object()], [new Object()], "not empty");

  check([1,2,3], [1,2,3,4]);
  check([0,1,2,3], [1,2,3], "235dsf435g gret sd");

  check([1, 5, 3], [1, 10, 3], null, 1);
}

void check(List arg1, List arg2, [String reason = null, int index = 0]) {
  try {
    Expect.listEquals(arg1, arg2, reason);
    throw new Exception("ExpectException expected");
  } on ExpectException catch(e) {
//  } on Error catch(e) {
    if(arg1.length != arg2.length) {
      if(!e.message.contains(arg1.length.toString(), 0) && !e.message.contains(arg2.length.toString(), 0)) {
        throw "exception message ( ${e.message} ) doesn't mention list lengths";
      }
      if (reason != null && !reason.isEmpty && !e.message.contains(reason, 0)) throw "no reason";
    } else {
      var a1 = arg1[index], a2 = arg2[index];
      String a1str = a1 != null ? a1.toString() : "null", 
          a2str = a2 != null ? a2.toString() : "null";

// TODO improve Expect.listEquals to inform index of the first mismatch
//      if (!e.message.contains('$index', 0))
//        throw "exception message: ( ${e.message} ) doesn't mention the index of first mismatch ($index)";
      
      if (!e.message.contains(a1str, 0)) 
        throw "exception message: ( ${e.message} ) doesn't mention the expected value ($a1str)";
          
      if (!e.message.contains(a2str, 0)) 
        throw "exception message: ( ${e.message} ) doesn't mention the actual value ($a2str)";
      
      if (reason != null && !reason.isEmpty && !e.message.contains(reason, 0)) 
        "exception message: ( ${e.message} ) doesn't mention the specified reason ($reason)";
    }
  }
}

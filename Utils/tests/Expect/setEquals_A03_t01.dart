/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion static void setEquals(Iterable expected, Iterable actual, [String reason = null])
 * Descriptive error message is provided in case of failure.
 * @description Checks that message of thrown ExpectException includes 
 *              representation of extra and missing elements, as well as the reason.
 * @author varlax
 * @reviewer msyabro
 */
import "../../../Utils/expect.dart";

main() {
  check(
      [0, 235892385, 1, "abracadabra"],
      [0, 235892385, 2 , "abracadabra"],
      [1, 2]
      );
  
  check([1,2,3],[2,3],[1], "blah sdsder rt3 4");
  check([234,456,777],[92374,3425,"assa"], [234,456,777,92374,3425,"assa"], "4 4 44  45  45 2__");
  
}

void check(Iterable arg1, Iterable arg2, Iterable arg3, [String reason = null]) {
  try {
    Expect.setEquals(arg1, arg2, reason);
    throw new Exception("ExpectException expected");
  } on ExpectException catch(e) {
    for (var el in arg3) {
      if (!e.message.contains(el != null ? el.toString() : "null", 0)) throw "no element $el";
    }
    if (reason != null && !reason.isEmpty && !e.message.contains(reason, 0)) throw "no reason";
  }
}

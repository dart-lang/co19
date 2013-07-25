/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion static void isNotNull(var actual, [String reason = null])
 * Descriptive error message is provided in case of failure.
 * @description Checks that message of thrown ExpectException includes 
 *              representation of the actual value, as well as the reason.
 * @author varlax
 * @reviewer msyabro
 */
import "../../../Utils/expect.dart";

main() {
  check(null);
  check(null, "");
  check(null, "not empty");
}

void check(var arg, [String reason = null]) {
  try {
    Expect.isNotNull(arg, reason);
    throw new Exception("ExpectException expected");
  } on ExpectException catch(e) {
    if (!e.message.contains("null", 0)) throw "no actual value";
    if (reason != null && !reason.isEmpty && !e.message.contains(reason, 0)) throw "no reason";
  }
}

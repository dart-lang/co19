/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion static void isFalse(var actual, [String reason = null]) 
 * Checks whether the actual value is a bool and its value is false.
 * @description Checks that using non-boolean argument or boolean true results
 *              in ExpectException being thrown. Arguments being tested include
 *              null, numeric and Object, along with null, empty and non-empty
 *              reason arguments.
 * @author rodionov
 * @reviewer varlax
 */
import "../../../Utils/expect.dart";

main() {
  check(0);
  check(0, "");
  check(0, "not empty");

  check(null);
  check(null, "");
  check(null, "not empty");

  check(true);
  check(true, "");
  check(true, "not empty");

  check(new Object());
  check(new Object(), "");
  check(new Object(), "not empty");
}

void check(var arg, [String reason = null]) {
  try {
    Expect.isFalse(arg, reason);
    throw new Exception("ExpectException expected");
  } on ExpectException catch(e) {
  }
}

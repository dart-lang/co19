/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion static void identical(var expected, var actual, [String reason = null]) 
 * Checks whether the expected and actual values are identical.
 * @description Checks that using non-identical arguments results in ExpectException
 *              being thrown. Arguments being tested include null, boolean, String, numeric and
 *              Object, along with null, empty and non-empty reason arguments.
 * @author rodionov
 * @reviewer varlax
 */
import "../../../Utils/expect.dart";

main() {
  check(0, null);
  check(0, null, "");
  check(0, null, "not empty");

  check(null, 0);
  check(null, 0, "");
  check(null, 0, "not empty");

  check(1, 0);
  check(1, 0, "");
  check(1, 0, "not empty");

  check(false, true);
  check(false, true, "");
  check(false, true, "not empty");
  
  check(false, 0);
  check(false, 0, "");
  check(false, 0, "not empty");

  check(1, true);
  check(1, true, "");
  check(1, true, "not empty");

  check(new Object(), new Object());
  check(new Object(), new Object(), "");
  check(new Object(), new Object(), "not empty");
}

void check(var arg1, var arg2, [String reason = null]) {
  try {
    Expect.identical(arg1, arg2, reason);
    throw new Exception("ExpectException expected");
  } on ExpectException catch(e) {
  }
}

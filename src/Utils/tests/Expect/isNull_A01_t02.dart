/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion static void isNull(var actual, [String reason = null])
 * Checks whether [actual] is null.
 * @description Checks that using non-null argument results in ExpectException
 *              being thrown. Arguments being tested include boolean, numeric and
 *              Object, along with null, empty and non-empty reason arguments.
 * @author rodionov
 * @reviewer varlax
 */
import "../../../Utils/expect.dart";

main() {
  check(0);
  check(0, "");
  check(0, "not empty");

  check(true);
  check(true, "");
  check(true, "not empty");

  check(false);
  check(false, "");
  check(false, "not empty");

  check(new Object());
  check(new Object(), "");
  check(new Object(), "not empty");
}

void check(var arg, [String reason = null]) {
  try {
    Expect.isNull(arg, reason);
    throw new Exception("ExpectException expected");
  } on ExpectException catch(e) {
  }
}

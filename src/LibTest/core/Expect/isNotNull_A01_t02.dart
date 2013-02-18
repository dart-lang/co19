/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion static void isNotNull(var actual, [String reason = null])
 * Checks whether [actual] is not null.
 * @description Checks that using a null argument results in ExpectException
 *              being thrown, regardless of whether the reason (2nd argument) is null.
 * @author rodionov
 * @reviewer varlax
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
  }
}

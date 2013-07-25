/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion static void fail(String msg)
 * Unconditional failure. 
 * @description Checks that this method always results in failure, regardless of whether
 * or not the argument is null or empty.
 * @author rodionov
 * @reviewer varlax
 * @needsreview The exact mechanism of signaling failure is not documented. We
 *              know it's ExpectException, though.
 */
import "../../../Utils/expect.dart";

main() {
  check(null);
  check("");
  check("sdjgksjdg");
}

void check(String msg) {
  try {
    Expect.fail(msg);
    throw new Exception("ExpectException expected");
  } on ExpectException catch(e) {
  }
}

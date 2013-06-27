/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion AssertionError class
 * Error thrown by the runtime system when an assert statement fails.
 * Implements Error
 * @description Checks that when an assert statement fails, an AssertionError is thrown.
 * Checks that AssertionError implements Error.
 * @author rodionov
 * @reviewer msyabro
 * @needsreview undocumented
 */
import "../../../Utils/dynamic_check.dart";
import "../../../Utils/expect.dart";

main() {
  if(!isCheckedMode()) {
    return;
  }
  try {
    assert(false);
    Expect.fail("AssertionError expected");
  } on AssertionError catch(e) {
    Expect.isTrue(e is Error);
  }
}

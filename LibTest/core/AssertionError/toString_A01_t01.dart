/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Undocumented
 * @description Checks that this method causes no error and the result is not
 * null and is indeed a String when the AssertionError is raised using assert
 * statement.
 * @author rodionov
 */
import "../../../Utils/expect.dart";
 
main() {
  try {
    assert(1 == 2);
    Expect.fail("AssertionError expected");
  } on AssertionError catch(e) {
    Expect.isTrue(e.toString() != null);
    Expect.isTrue(e.toString() is String);
  }
}

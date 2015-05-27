/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion static void stringEquals(String expected, String actual, [String reason = null])
 * Specialized equality test for strings. 
 * @description Checks that no exception is thrown when the string arguments are
 *              equal (including the case when they're null), regardless of
 *              reason (the last argument). Null, numeric and Object values are
 *              tested.
 * @author rodionov
 * @reviewer varlax
 */
import "../../../Utils/expect.dart";

main() {
  Expect.stringEquals("", "");
  Expect.stringEquals("", "", "");
  Expect.stringEquals("", "", "not empty");

  Expect.stringEquals(null, null);
  Expect.stringEquals(null, null, "");
  Expect.stringEquals(null, null, "not empty");
  
  Expect.stringEquals("foo" "bar", "foob" "ar");
  Expect.stringEquals("foo" "bar", "foob" "ar", "");
  Expect.stringEquals("foo" "bar", "foob" "ar", "not empty");
}

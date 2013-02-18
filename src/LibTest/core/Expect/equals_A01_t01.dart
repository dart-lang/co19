/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion static void equals(var expected, var actual, [String reason = null])
 * Checks whether the expected and actual values are equal (using [:==:]).
 * @description Checks that no exception is thrown when the arguments are equal,
 *              regardless of reason (the last argument). Null, numeric and Object values are tested.
 * @author rodionov
 * @reviewer varlax
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals(null, null);
  Expect.equals(null, null, "");
  Expect.equals(null, null, "not empty");

  Expect.equals(1, 1);
  Expect.equals(1, 1, "");
  Expect.equals(1, 1, "not empty");
  
  var foo = new Object();
  Expect.equals(foo, foo);
  Expect.equals(foo, foo, "");
  Expect.equals(foo, foo, "not empty");
}

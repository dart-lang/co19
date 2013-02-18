/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion static void isFalse(var actual, [String reason = null])
 * Checks whether the actual value is a bool and its value is false. 
 * @description Checks that no exception is thrown when the argument is a bool and its value is false,
 *              regardless of reason (the last argument).
 * @author rodionov
 * @reviewer varlax
 */
import "../../../Utils/expect.dart";

main() {
  Expect.isFalse(false);
  Expect.isFalse(false, "");
  Expect.isFalse(false, "not empty");
}

/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion static void isNull(var actual, [String reason = null])
 * Checks whether [actual] is null.
 * @description Checks that no exception is thrown when the argument is null,
 *              regardless of reason (the last argument).
 * @author rodionov
 * @reviewer varlax
 */
import "../../../Utils/expect.dart";

main() {
  Expect.isNull(null);
  Expect.isNull(null, "");
  Expect.isNull(null, "not empty");
}

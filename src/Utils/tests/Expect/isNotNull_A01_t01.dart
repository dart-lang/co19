/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion static void isNotNull(var actual, [String reason = null])
 * Checks whether [actual] is not null.
 * @description Checks that no exception is thrown when the argument is not null,
 *              regardless of reason (the last argument). Boolean, numeric and Object
 *              arguments are used.
 * @author rodionov
 * @reviewer varlax
 */
import "../../../Utils/expect.dart";

main() {
  Expect.isNotNull(true);
  Expect.isNotNull(true, "");
  Expect.isNotNull(true, "not empty");

  Expect.isNotNull(false);
  Expect.isNotNull(false, "");
  Expect.isNotNull(false, "not empty");

  Expect.isNotNull(0);
  Expect.isNotNull(0, "");
  Expect.isNotNull(0, "not empty");

  Expect.isNotNull(new Object());
  Expect.isNotNull(new Object(), "");
  Expect.isNotNull(new Object(), "not empty");
}

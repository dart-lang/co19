/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion StateError(String message)
 * @description Checks that this constructor executes without error.
 * @author rodionov
 */
import "../../../Utils/expect.dart";

main() {
  StateError se = new StateError("State error");
  Expect.equals("State error", se.message);

  StateError se2 = new StateError("");
  Expect.equals("", se2.message);
}

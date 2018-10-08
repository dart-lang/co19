/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion new ArgumentError([message])
 * The message describes the erroneous argument. 
 * @description Checks that this constructor executes without error for various
 * strings and null.
 * @author kaigorodov
 */

import "../../../Utils/expect.dart";
 
void check(var message) {
  ArgumentError err = new ArgumentError(message);
  Expect.equals(message, err.message);
}

main() {
  check(null);
  check("");
  check("foo");
  check("You are not paid to think!");
}

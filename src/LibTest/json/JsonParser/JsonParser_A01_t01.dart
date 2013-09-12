/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion new JsonParser(String source, JsonListener listener)
 * Creates a new Object instance.
 * @description Checks that this constructor executes without error for various strings and null.
 * @author kaigorodov
 */

import "dart:json";
import "../../../Utils/expect.dart";

void check(String source) {
  JsonListener listener = new BuildJsonListener();
  JsonParser jp = new JsonParser(source, listener);
}

main() {
  check(null);
  check("");
  check("foo");
  check("You are not paid to think!");
}

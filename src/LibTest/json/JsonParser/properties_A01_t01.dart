/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Properties
 * final JsonListener listener
 * final String source
 * @description Checks that these properties reflect constructor's arguments.
 * @author kaigorodov
 */

import "dart:json";
import "../../../Utils/expect.dart";

void check(String source, JsonListener listener) {
  JsonParser jp = new JsonParser(source, listener);
  Expect.identical(source, jp.source);
  Expect.identical(listener, jp.listener);
}

main() {
  check(null, new BuildJsonListener());
  check("", new BuildJsonListener());
  check("foo", null);
  check("You are not paid to think!", new BuildJsonListener());
}

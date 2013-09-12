/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion BuildJsonListener class
 * A JsonListener that builds data objects from the parser events.
 * This is a simple stack-based object builder. It keeps the most recently seen
 * value in a variable, and uses it depending on the following event.
 * @description checks that BuildJsonListener builds data objects as expected.
 * @author kaigorodov
 */

import "dart:json";
import "../../../Utils/expect.dart";

void check(String source, Object expected) {
  BuildJsonListener listener=new BuildJsonListener();
  JsonParser jp = new JsonParser(source, listener);
  jp.parse();
  Expect.deepEquals(expected, listener.result);
}

main() {
  check("null", null);
  check("123", 123);
  check("[]", []);
  check('{"a":1}', {"a":1});
  check('[[],{"a":1}, null, true, false, 22, "s"]'
       , [[],{"a":1}, null, true, false, 22, "s"]);
  check('{"0":[],"key2":{"a":1}, "n":null, "t":true, "f":false, "22":22, "s":"s"}'
       , {"0":[],"key2":{"a":1}, "n":null, "t":true, "f":false, "22":22, "s":"s"});
}

/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void parse()
 * Parses source, or throws if it fails. 
 * @description checks that this method throws when a syntax error
 * in input string is encountered.
 * @needsreview  #10844
 * @author kaigorodov
 */

import "dart:json";
import "../../../Utils/expect.dart";

void checkNoError(String source) {
  JsonParser jp = new JsonParser(source, new BuildJsonListener());
  jp.parse();
}

void checkError(String source) {
  JsonParser jp = new JsonParser(source, new BuildJsonListener());
  Expect.throws((){ jp.parse();});
}

main() {
  checkNoError("[]");
  checkNoError('[[],{"a":1}, null, true, false, 22, "s"]');
  checkNoError('{"a":1}');
  checkError("");
  checkNoError("null");
  checkNoError("true");
  checkNoError("false");
  checkNoError("1");
  checkNoError('"1"');
  checkError(":");
  checkError("foo");
  checkError("{'a':1}");
}

/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void fail(int position, [String message])
 * called when a syntax error in input string is encountered.
 * @note undocumented
 * @description checks that this method is called when a syntax error
 * in input string is encountered.
 * @author kaigorodov
 */

import "dart:json";
import "../../../Utils/expect.dart";

class MyJsonParser extends JsonParser {
  int position=null;
  
  MyJsonParser(String source, JsonListener listener):super(source, listener);
  
  void fail(int position, [String message]) {
    this.position=position;
  }
}

void checkNoError(String source) {
  MyJsonParser jp = new MyJsonParser(source, new BuildJsonListener());
  jp.parse();
  
  Expect.isNull(jp.position);
}

void checkError(String source) {
  MyJsonParser jp = new MyJsonParser(source, new BuildJsonListener());
  try {
    jp.parse();
  } catch (ok) {
  }
  
  Expect.isNotNull(jp.position);
}

main() {
  checkNoError("[]");
  checkNoError('{"a":1}');
  checkError("");
  checkError(":");
  checkError("foo");
  checkError("{'a':1}");
}

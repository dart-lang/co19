/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int parseString(int position) 
 * Parses a string literal starting at position.
 * source[position] contains the first symbol of a string.
 * @note undocumented
 * @description checks that this method is called only when source[position-1] contains '"'.
 * @author kaigorodov
 */

import "dart:json";
import "../../../Utils/expect.dart";

class MyJsonParser extends JsonParser {
  int position=null;
  
  MyJsonParser(String source, JsonListener listener):super(source, listener);
  
  int parseString(int position) {
    Expect.isTrue(position>0);
    this.position=position;
    Expect.equals('"', source[position-1]);
    return super.parseString(position);
  }
}

void check(String source, int position) {
  MyJsonParser jp = new MyJsonParser(source, new BuildJsonListener());
  jp.parse();
  
  Expect.equals(position, jp.position);
}

main() {
  check("[]", null);
  check("[null]", null);
  check('{"1":null}', 2);
  check('"a"', 1);
  check('["1,2,3","4,4,6"]', 10);
}

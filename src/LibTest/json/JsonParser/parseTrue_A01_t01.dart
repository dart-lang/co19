/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int parseTrue(int position)
 * Parses a "true" literal starting at position.
 * source[position] must be "t".
 * Called when source[position] contains "t".
 * @note undocumented
 * @description checks that this method is called only when source[position] contains "f".
 * @author kaigorodov
 */

import "dart:json";
import "../../../Utils/expect.dart";

class MyJsonParser extends JsonParser {
  int position=null;
  
  MyJsonParser(String source, JsonListener listener):super(source, listener);
  
  int parseTrue(int position) {
    this.position=position;
    Expect.equals("t", source[position]);
    return super.parseTrue(position);
  }
}

void check(String source, int position) {
  MyJsonParser jp = new MyJsonParser(source, new BuildJsonListener());
  jp.parse();
  
  Expect.equals(position, jp.position);
}

main() {
  check("[]", null);
  check('{"a":1}', null);
  check("true", 0);
  check("[true]", 1);
  check('{"1":true}', 5);
  check("[true,true]", 6);
}

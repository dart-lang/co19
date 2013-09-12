/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int parseNumber(int char, int position) 
 * Parses a number literal starting at position.
 * argument char equals to source.codeUnitAt(position) and contains a digit.
 * @note undocumented
 * @description checks that this method is called only when source[position] contains a digit.
 * @author kaigorodov
 */

import "dart:json";
import "../../../Utils/expect.dart";

class MyJsonParser extends JsonParser {
  int position=null;
  
  MyJsonParser(String source, JsonListener listener):super(source, listener);
  
  int parseNumber(int char, int position) {
    this.position=position;
    int codeUnit=source.codeUnitAt(position);
    Expect.equals(char, codeUnit);
    Expect.isTrue((codeUnit>=0x30)&&(codeUnit<=0x39), "not a digit:$char");
    return super.parseNumber(char, position);
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
  check('{"1":null}', null);
  check('{"a":1}', 5);
  check("9", 0);
  check('[1,2,3]', 5);
}

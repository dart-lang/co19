/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 15.10.2.10: The production CharacterEscape ::
 *            UnicodeEscapeSequence evaluates by evaluating the character value
 *            of the UnicodeEscapeSequence (see 7.8.4) and returning its
 *            character result.<br/> HexEscapeSequence :: u HexDigit HexDigit
 *            HexDigit HexDigit
 * @description Checks the assertion using some uncommon \u-encoded characters
 *              in the test string.
 * @3rdparty sputnik-v1:S15.10.2.10_A4.1_T1.js
 * @author rodionov
 */
import "../../../../Utils/expect.dart";
 

main() {
  Map<String, String> codes = const {
    "0000" : "\u0000", "0001" : "\u0001", "000A" : "\u000A", "000F" : "\u000F",
    "00FF" : "\u00FF", "0FFF" : "\u0FFF", "FFFF" : "\uFFFF", "F00F" : "\uF00F"
  };
  
  StringBuffer errStr = new StringBuffer();
  codes.forEach((String key, String value) {
    RegExp re = new RegExp("\\u$key");
    if(null == re.firstMatch(value)) {
      errStr.write("\"\\u${key}\" does not match \"${value}\"\n");
    } 
  });
  
  if(errStr.length > 0) {
    Expect.fail(errStr.toString());
  }
}

/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 15.10.2.10: The production CharacterEscape :: HexEscapeSequence
 *            evaluates by evaluating the character value of the
 *            HexEscapeSequence (see 7.8.4) and returning its character result.<br/>
 *            HexEscapeSequence :: x HexDigit HexDigit
 * @description Checks the assertion using a matching \u-encoded character in
 *              the test string.
 * @3rdparty sputnik-v1:S15.10.2.10_A3.1_T1.js, S15.10.2.10_A3.1_T2.js
 * @author rodionov
 */
import "../../../../Utils/expect.dart";
 

main() {
  Map<String, String> alphabet = const {
    "41" : "A", "42" : "B", "43" : "C", "44" : "D", "45" : "E", "46" : "F",
    "47" : "G", "48" : "H", "49" : "I", "4A" : "J", "4B" : "K", "4C" : "L",
    "4D" : "M", "4E" : "N", "4F" : "O", "50" : "P", "51" : "Q", "52" : "R",
    "53" : "S", "54" : "T", "55" : "U", "56" : "V", "57" : "W", "58" : "X",
    "59" : "Y", "5A" : "Z", "61" : "a", "62" : "b", "63" : "c", "64" : "d",
    "65" : "e", "66" : "f", "67" : "g", "68" : "h", "69" : "i", "6A" : "j",
    "6B" : "k", "6C" : "l", "6D" : "m", "6E" : "n", "6F" : "o", "70" : "p",
    "71" : "q", "72" : "r", "73" : "s", "74" : "t", "75" : "u", "76" : "v",
    "77" : "w", "78" : "x", "79" : "y", "7A" : "z", "00" : "\u0000",
    "01" : "\u0001", "0A" : "\u000A", "FF" : "\u00FF"
  };
  
  StringBuffer errStr = new StringBuffer();
  alphabet.forEach((String key, String value) {
    RegExp re = new RegExp("\\x$key");
    if(null == re.firstMatch(value)) {
      errStr.write("\"\\x${key}\" does not match \"${value}\"\n");
    } 
  });
  
  if(errStr.length > 0) {
    Expect.fail(errStr.toString());
  }
}

/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 15.10.2.12: The production CharacterClassEscape :: W evaluates by
 *            returning the set of all characters not included in the set
 *            returned by CharacterClassEscape :: w.
 * @description Checks that \W indeed matches all but the specified characters
 *              (tested vs all characters from the basic plane)
 * @3rdparty sputnik-v1:S15.10.2.12_A4_T1.js-S15.10.2.12_A4_T5.js
 * @author rodionov
 */
import "../../../../Utils/expect.dart";
 

main() {
  RegExp re = new RegExp("\\W");
  for (int alpha = 0x0000; alpha <= 0xFFFF; alpha++) {
    String ch = new String.fromCharCodes([alpha]);
    if((alpha >= 0x0030 && alpha <= 0x0039) // the 10 digits
      || (alpha >= 0x0041 && alpha <= 0x005A) // the uppercase english letters
      || (alpha >= 0x0061 && alpha <= 0x007A) // the lowercase english letters
      || (alpha == 0x005F)) { // the underscore
        if(null != re.firstMatch(ch)) {
          Expect.fail("\\W ~ '$ch'");
        }
    } else {
      if(null == re.firstMatch(ch)) {
        Expect.fail("\\W !~ '$ch'");
      }
    }
  }
}

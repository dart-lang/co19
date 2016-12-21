/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 15.10.2.12: The production CharacterClassEscape :: d evaluates by
 *            returning the ten-element set of characters containing the
 *            characters 0 through 9 inclusive.
 * @description Checks that \d works as described.
 * @3rdparty sputnik-v1:S15.10.2.12_A5_T1.js-S15.10.2.12_A5_T3.js
 * @author rodionov
 */
import "../../../../Utils/expect.dart";
 

main() {
  RegExp re = new RegExp("\\d");
  for (int alpha = 0x0000; alpha <= 0xFFFF; alpha++) {
    if(alpha >= 0x0030 && alpha <= 0x0039) {
      // a decimal digit
      if(null == re.firstMatch(new String.fromCharCodes([alpha]))) {
        Expect.fail("\\d !~ char($alpha)");
      }
    } else {
      if(null != re.firstMatch(new String.fromCharCodes([alpha]))) {
        Expect.fail("\\d ~ char($alpha)");
      }
    }
  }
}

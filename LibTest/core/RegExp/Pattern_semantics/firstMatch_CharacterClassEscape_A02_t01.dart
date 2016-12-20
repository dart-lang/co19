/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 15.10.2.12: The production CharacterClassEscape :: D evaluates by
 *            returning the set of all characters not included in the set
 *            returned by CharacterClassEscape :: d.
 * @description Checks that \D works as described.
 * @3rdparty sputnik-v1:S15.10.2.12_A6_T1.js-S15.10.2.12_A6_T3.js
 * @author rodionov
 */
import "../../../../Utils/expect.dart";
 

main() {
  RegExp re = new RegExp("\\D");
  for (int alpha = 0x0000; alpha <= 0xFFFF; alpha++) {
    if(alpha < 0x0030 || alpha > 0x0039) {
      // not a decimal digit
      if(null == re.firstMatch(new String.fromCharCodes([alpha]))) {
        Expect.fail("\\D !~ char($alpha)");
      }
    } else {
      if(null != re.firstMatch(new String.fromCharCodes([alpha]))) {
        Expect.fail("\\D ~ char($alpha)");
      }
    }
  }
}

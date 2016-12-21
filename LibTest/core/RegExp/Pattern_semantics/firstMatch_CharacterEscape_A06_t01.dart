/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The production CharacterEscape :: c ControlLetter evaluates as
 *            follows:
 *            <ol>
 *            <li>Let ch be the character represented by ControlLetter.</li>
 *            <li>Let i be ch's code unit value.</li>
 *            <li>Let j be the remainder of dividing i by 32.</li>
 *            <li>Return the character whose code unit value is j.</li>
 *            </ol>
 *            <br/>ControlLetter :: one of
 *            <ul>
 *            <li>a-z</li>
 *            <li>A-Z</li>
 *            </ul>
 * @description Checks that patterns with supported control letters evaluate to
 *              the specified characters.
 * @3rdparty sputnik-v1:S15.10.2.10_A2.1_T1.js, S15.10.2.10_A2.1_T2.js
 * @author rodionov
 */
import "../../../../Utils/expect.dart";
 

main() {
// ctrl+[A-Z]
  for(var alpha = 0x0041; alpha <= 0x005A; alpha++) {
    RegExp re = new RegExp("\\c${new String.fromCharCodes([alpha])}");
    String str = new String.fromCharCodes([alpha % 32]);
    Expect.isTrue(null != re.firstMatch(str));
  }

// ctrl+[a-z]
  for(var alpha = 0x0061; alpha <= 0x007A; alpha++) {
    RegExp re = new RegExp("\\c${new String.fromCharCodes([alpha])}");
    String str = new String.fromCharCodes([alpha % 32]);
    Expect.isTrue(null != re.firstMatch(str));
  }
}

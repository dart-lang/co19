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
 * @description Checks that the specified algorithm does not extend to
 *              unsupported control letters (using ranges between and around the
 *              supported ones).
 * @author rodionov
 * @note Issue 1293
 */
import "../../../../Utils/expect.dart";
 

main() {
// Not sure this test makes sense at all.
  List<int> errors = new List<int>();
  for(var alpha = 0x0021; alpha < 0x0040; alpha++) {
    RegExp re = new RegExp("\\c${new String.fromCharCodes([alpha])}");
    String str = new String.fromCharCodes([alpha % 32]);
    if(null != re.firstMatch(str)) {
      errors.add(alpha);
    }
  }

  for(var alpha = 0x005B; alpha < 0x0060; alpha++) {
    RegExp re = new RegExp("\\c${new String.fromCharCodes([alpha])}");
    String str = new String.fromCharCodes([alpha % 32]);
    if(null != re.firstMatch(str)) {
      errors.add(alpha);
    }
  }

  for(var alpha = 0x007B; alpha <= 0x044F; alpha++) {
    if(alpha % 32 == 0) {
      continue; // \u0000 seems to match anything??!
    }
    RegExp re = new RegExp("\\c${new String.fromCharCodes([alpha])}");
    String str = new String.fromCharCodes([alpha % 32]);
    if(null != re.firstMatch(str)) {
      errors.add(alpha);
    }
  }
    
  if(errors.length > 0) {
    StringBuffer errStr = new StringBuffer();
    void f(int alpha) {
      errStr.write("\"\\c${new String.fromCharCodes([alpha])} \" matches \""
           "${new String.fromCharCodes([alpha % 32])}\", although it should not\n");
    }
    errors.forEach(f);
    Expect.fail(errStr.toString());
  }
}

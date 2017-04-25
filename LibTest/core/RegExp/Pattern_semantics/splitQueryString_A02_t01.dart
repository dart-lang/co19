/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 15.10.2.12: The production CharacterClassEscape :: S evaluates by
 *            returning the set of all characters not included in the set
 *            returned by CharacterClassEscape :: s.
 * @description Checks that \S indeed matches all characters but the 26
 *              whitespace and line terminator ones (tested vs all characters
 *              from the basic plane)
 * @3rdparty sputnik-v1:S15.10.2.12_A2_T1.js-S15.10.2.12_A2_T5.js
 * @author rodionov
 * @note issue 1296
 */
import "../../../../Utils/expect.dart";
 

main() {
  RegExp re = new RegExp("\\S");
  List<String> errors = new List<String>();
  for (int alpha = 0x0000; alpha <= 0xFFFF; alpha++) {
    switch(alpha) {
      // white space as per chapter 7.2
      case 0x0009:
      case 0x000B:
      case 0x000C:
      case 0x0020:
      case 0x00A0:
      case 0xFEFF:
      // category Zs
      case 0x1680:
      case 0x2000:
      case 0x2001:
      case 0x2002:
      case 0x2003:
      case 0x2004:
      case 0x2005:
      case 0x2006:
      case 0x2007:
      case 0x2008:
      case 0x2009:
      case 0x200A:
      case 0x202F:
      case 0x205F:
      case 0x3000:
      // line terminators as per chapter 7.3
      case 0x000A:
      case 0x000D:
      case 0x2028:
      case 0x2029:
        if(null != re.firstMatch(new String.fromCharCodes([alpha]))) {
          errors.add("\\S ~ char($alpha)");
        }
        break;
      default:
        if(null == re.firstMatch(new String.fromCharCodes([alpha]))) {
          errors.add("\\S !~ char($alpha)");
        }
        break;
    }
  }
  if(errors.length > 0) {
    StringBuffer sb=new StringBuffer();
    sb.writeAll(errors, "\n");
    Expect.fail("\n"+sb.toString());
  }
}

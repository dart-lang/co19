/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 15.10.2.8: In case-insignificant matches all characters are
 *            implicitly converted to upper case immediately before they are
 *            compared. However, if converting a character to upper case would
 *            expand that character into more than one character (such as
 *            converting "ß" (\u00DF) into "SS"), then the character is left
 *            as-is instead. The character is also left as-is if it is not an
 *            ASCII character but converting it to upper case would make it into
 *            an ASCII character. This prevents Unicode characters such as
 *            \u0131 and \u017F from matching regular expressions such as
 *            /[a-z]/i, which are only intended to match ASCII letters.
 *            Furthermore, if these conversions were allowed, then /[^\W]/i
 *            would match each of a, b, …, h, but not i or s.
 * @description Checks that this assertion is true.
 * @3rdparty sputnik-v1:S15.10.2.8_A5_T1.js-S15.10.2.8_A5_T2.js
 * @author rodionov
 * @reviewer msyabro
 */
import "../../../../Utils/expect.dart";
 

main() {
  check(r"[a-z]+", "ABC def ghi", ignoreCase: true, matchPos: 0,
      expectedGroups: ["ABC"]);
  check(r"[a-z]+", "ABC def ghi", matchPos: 4, expectedGroups: ["def"]);
  checkNeg(r"[A-Z]+", "ß", ignoreCase: true);
  checkNeg(r"[A-Z]+", "\u0131", ignoreCase: true);
  checkNeg(r"[A-Z]+", "\u017F", ignoreCase: true);
}

void check(String pattern, String str, {bool multiLine: false,
    bool ignoreCase: false, int matchPos: -1, List<String> expectedGroups: null}) {
  RegExp re = new RegExp(pattern, multiLine: multiLine,
      caseSensitive: !ignoreCase);
  Match fm = re.firstMatch(str);
  if(null == fm) {
    Expect.fail("\"$pattern\" !~ \"$str\"");
  }
  if(matchPos >= 0) {
    Expect.equals(matchPos, fm.start);
  }
  if(null != expectedGroups) {
    Expect.equals(expectedGroups.length, fm.groupCount + 1);
    
    for(int i = 0; i <= fm.groupCount; i++) {
      String expGr = expectedGroups[i];
      String actGr = fm.group(i);
      if(expGr != actGr) {
        Expect.fail("Mismatch at group $i: \"$expGr\" expected instead of \"$actGr\"");
      }
    }
  }
}

void checkNeg(String pattern, String str, {bool multiLine: false,
    bool ignoreCase: false}) {
  RegExp re = new RegExp(pattern, multiLine: multiLine,
      caseSensitive: !ignoreCase);
  if(null != re.firstMatch(str)) {
    Expect.fail("\"$pattern\" ~ \"$str\"");
  }
}

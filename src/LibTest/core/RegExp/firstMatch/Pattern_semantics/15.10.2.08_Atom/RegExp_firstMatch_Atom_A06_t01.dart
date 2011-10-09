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
 */
 

main() {
  check(@"[a-z]+", "ABC def ghi", "ig", 0, ["ABC"]);
  check(@"[a-z]+", "ABC def ghi", "", 4, ["def"]);
  checkNeg(@"[A-Z]+", "ß", "i");
  checkNeg(@"[A-Z]+", "\u0131", "i");
  checkNeg(@"[A-Z]+", "\u017F", "i");
}

void check(String pattern, String str, String flags = "", int matchPos = -1, Array<String> expectedGroups = null) {
  Logger.println("\nPattern: \"$pattern\"\n" +
      "String: \"$str\"\n" +
      "Flags: \"$flags\"\n" +
      "Exp. groups: \"$expectedGroups\"");
  RegExp re = new RegExp(pattern, flags);
  Match fm = re.firstMatch(str);
  Logger.println("group count: " + fm.groupCount());
  if(null == fm) {
    Expect.fail("\"$pattern\" !~ \"$str\"");
  }
  if(matchPos >= 0) {
    Expect.equals(matchPos, fm.start(0));
  }
  if(null != expectedGroups) {
    Expect.equals(expectedGroups.length, fm.groupCount() + 1);
    
    for(int i = 0; i <= fm.groupCount(); i++) {
      String expGr = expectedGroups[i];
      String actGr = fm.group(i);
      Logger.println("\t$expGr == $actGr ??");
      if(expGr != actGr) {
        Expect.fail("Mismatch at group $i: \"$expGr\" expected instead of \"$actGr\"");
      }
    }
  }
}

void checkNeg(String pattern, String str, String flags = "") {
  RegExp re = new RegExp(pattern, flags);
  if(null != re.firstMatch(str)) {
    Expect.fail("\"$pattern\" ~ \"$str\"");
  }
}

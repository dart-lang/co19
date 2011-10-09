/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 15.10.2.7: The production QuantifierPrefix :: {DecimalDigits}
 *            evaluates by returning the MV of DecimalDigits.
 * @description Checks that this quantifier is applied correctly in various
 *              scenarios.
 * @3rdparty sputnik-v1:S15.10.2.7_A2_T1.js-S15.10.2.7_A2_T4.js
 * @author rodionov
 */
 

main() {
  check(@"[a-zA-Z]{3}\d{2}", "xa124dfdg08", "", 6, ["fdg08"]);
  check(@"b{2}c", "aaabbbbcccddeeeefffff", "", 5, ["bbc"]);
  checkNeg(@"b{8}", "aaabbbbcccddeeeefffff");
}

void check(String pattern, String str, String flags = "", int matchPos = -1, Array<String> expectedGroups = null) {
  RegExp re = new RegExp(pattern, flags);
  Match fm = re.firstMatch(str);
  Logger.println("\nPattern: \"$pattern\"\n" +
      "String: \"$str\"\n" +
      "Flags: \"$flags\"\n" +
      "Exp. groups: \"$expectedGroups\"");
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

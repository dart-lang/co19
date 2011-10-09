/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 15.10.2.5: Once the minimum number of repetitions has been
 *            satisfied, any more expansions of Atom that match the empty String
 *            are not considered for further repetitions. This prevents the
 *            regular expression engine from falling into an infinite loop on
 *            certain patterns.
 * @description Checks that the infinite loops are indeed avoided (no stack
 *              overflow or other errors occur).
 * @author rodionov
 */
 

main() {
  check("(a*)b\\1+", "baaaac", "", ["b", ""]);
  check("(a*)*", "b", "", ["", ""]);
}

void check(String pattern, String str, String flags = "", Array<String> expectedGroups = null) {
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
  Logger.println("Match ok!\n");
}

void checkNeg(String pattern, String str, String flags = "") {
  RegExp re = new RegExp(pattern, flags);
  if(null != re.firstMatch(str)) {
    Expect.fail("\"$pattern\" ~ \"$str\"");
  }
}

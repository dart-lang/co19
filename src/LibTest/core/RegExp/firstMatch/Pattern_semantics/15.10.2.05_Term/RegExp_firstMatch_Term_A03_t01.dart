/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 15.10.2.5: Atom's captures are cleared each time Atom is repeated.
 * @description Checks that the assertion is true.
 * @3rdparty sputnik-v1:S15.10.2.5_A1_T4.js
 * @author rodionov
 */
 

main() {
  check("(z)((a+)?(b+)?(c))*", "zaacbbbcac", "", ["zaacbbbcac", "z", "ac", "a", "", "c"]);
  check("(z)((a+)?(b+)?(c))*", "zaacbbbc", "", ["zaacbbbc", "z", "bbbc", "", "bbb", "c"]);
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
}

void checkNeg(String pattern, String str, String flags = "") {
  RegExp re = new RegExp(pattern, flags);
  if(null != re.firstMatch(str)) {
    Expect.fail("\"$pattern\" ~ \"$str\"");
  }
}

/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 15.10.2.3: The | regular expression operator separates two
 *            alternatives. The pattern first tries to match the left
 *            Alternative (followed by the sequel of the regular expression); if
 *            it fails, it tries to match the right Disjunction (followed by the
 *            sequel of the regular expression). If the left Alternative, the
 *            right Disjunction, and the sequel all have choice points, all
 *            choices in the sequel are tried before moving on to the next
 *            choice in the left Alternative. If choices in the left Alternative
 *            are exhausted, the right Disjunction is tried instead of the left
 *            Alternative. Any capturing parentheses inside a portion of the
 *            pattern skipped by | produce undefined values instead of Strings.
 * @description Checks that a valid disjunction pattern works as described and that the captured groups have correct values.
 * @3rdparty sputnik-v1:S15.10.2.3_A1_T1.js-S15.10.2.3_A1_T17.js
 * @author rodionov
 * @note We're assuming JS's undefined values translate to nulls in Dart.
 * @needsreview
 */
 

main() {
  check("a|ab", "abc");
  check("\\d{3}|[a-z]{4}", "2, 12 and of course repeat 12");
  checkNeg("\\d{3}|[a-z]{4}", "2, 12 and 23 AND 0.00.1");
  check("ab|cd|ef", "AEKFCD", "i");
  checkNeg("ab|cd|ef", "AEKFCD");
  check("11111|111", "1111111111111111");
  check("xyz|...", "abc");
  check("(ab|cd)+|ef",                  "AEKFCD",       "i",  ["CD", "CD"]);
  check("(ab|cd)+|ef",                  "AEKFCDab",     "i",  ["CDab", "ab"]);
  check("(ab|cd)+|ef",                  "AEKeFCDab",    "i",  ["eF", ""]);
  check("(.)..|abc",                    "abc",          "",   ["abc", "a"]);
  check(".+: gr(a|e)y",                 "color: grey",  "",   ["color: grey", "e"]);
  check("(Rob)|(Bob)|(Robert)|(Bobby)", "Hi Bob",       "",   ["Bob", "", "Bob", "", ""]);
  check("()|",                          "",             "",   ["", ""]);
  check("|()",                          "",             "",   ["", ""]);
  check("((a)|(ab))((c)|(bc))",         "abc",          "",   ["abc", "a", "a", "", "bc", "", "bc"]);
}

void check(String pattern, String str, String flags = "", Array<String> expectedGroups = null) {
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
  if(null != expectedGroups) {
    Expect.equals(expectedGroups.length, fm.groupCount() + 1);
    
    for(int i = 0; i <= fm.groupCount(); i++) {
      String expGr = expectedGroups[i];
      String actGr = fm.group(i);
      Logger.println("\tgroup $i: $expGr == $actGr ??");
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

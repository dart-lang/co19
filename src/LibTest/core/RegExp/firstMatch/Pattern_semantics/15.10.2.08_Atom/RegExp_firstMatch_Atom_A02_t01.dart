/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 15.10.2.8: The form (?! Disjunction ) specifies a zero-width
 *            negative lookahead. In order for it to succeed, the pattern inside
 *            Disjunction must fail to match at the current position. The
 *            current position is not advanced before matching the sequel.
 *            Disjunction can contain capturing parentheses, but backreferences
 *            to them only make sense from within Disjunction itself.
 *            Backreferences to these capturing parentheses from elsewhere in
 *            the pattern always return undefined because the negative lookahead
 *            must fail for the pattern to succeed.
 * @description Checks that this syntax works as specified.
 * @3rdparty sputnik-v1:S15.10.2.8_A2_T1.js-S15.10.2.8_A2_T11.js
 * @author rodionov
 */
 

main() {
  check(@"Java(?!Script)([A-Z]\w*)", "using of JavaBeans technology", "", 9, ["JavaBeans", "Beans"]);
  checkNeg(@"Java(?!Script)([A-Z]\w*)", "using of Java language");
  checkNeg(@"Java(?!Script)([A-Z]\w*)", "I\"m a JavaScripter");
  check(@"Java(?!Script)([A-Z]\w*)", "JavaScr oops ipt ", "", 0, ["JavaScr", "Scr"]);
  check(@"(\.(?!com|org)|/)", "ah.info", "", 2, [".", "."]);
  check(@"(\.(?!com|org)|/)", "ah/info", "", 2, ["/", "/"]);
  checkNeg(@"(\.(?!com|org)|/)", "ah.com");
  check(@"(?!a|b)|c", "", "", 0, [""]);
  check(@"(?!a|b)|c", "bc", "", 1, [""]);
  check(@"(?!a|b)|c", "d", "", 0, [""]);
  check(@"(.*?)a(?!(a+)b\2c)\2(.*)", "baaabaac", "", 0, ["baaabaac", "ba", "", "abaac"]);
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

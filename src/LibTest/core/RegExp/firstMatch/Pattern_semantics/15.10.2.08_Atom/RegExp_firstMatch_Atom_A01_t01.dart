/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 15.10.2.8: The form (?= Disjunction ) specifies a zero-width
 *            positive lookahead. In order for it to succeed, the pattern inside
 *            Disjunction must match at the current position, but the current
 *            position is not advanced before matching the sequel. If
 *            Disjunction can match at the current position in several ways,
 *            only the first one is tried. Unlike other regular expression
 *            operators, there is no backtracking into a (?= form (this unusual
 *            behaviour is inherited from Perl). This only matters when the
 *            Disjunction contains capturing parentheses and the sequel of the
 *            pattern contains backreferences to those captures.
 * @description Checks that this syntax works as specified.
 * @3rdparty sputnik-v1:S15.10.2.8_A1_T1.js-S15.10.2.8_A1_T5.js
 * @author rodionov
 * @needsreview
 */
 

main() {
  check(@"(?=(a+))", "baaabac", "", 1, ["", "aaa"]);
  check(@"(?=(a+))a*b\1", "baaabac", "", 3, ["aba", "a"]);
  check(@"[Jj]ava([Ss]cript)?(?=\:)", "just Javascript: the way af jedi", "", 5, ["Javascript", "script"]);
  check(@"[Jj]ava([Ss]cript)?(?=\:)", "taste of java: the cookbook", "", 9, ["java", ""]);
  checkNeg(@"[Jj]ava([Ss]cript)?(?=\:)", "rhino is JavaScript engine");
  checkEx(@"(?=a)b\1", "aabb");
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

void checkEx(String pattern, String str, String flags = "") {
  try {
    RegExp re = new RegExp(pattern, flags);
    re.firstMatch(str);
    Expect.fail("An error expected");
  } catch(var ok) {
    // TODO
  }
}

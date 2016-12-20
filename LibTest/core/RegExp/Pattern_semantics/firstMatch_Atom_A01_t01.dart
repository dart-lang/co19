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
 */
import "../../../../Utils/expect.dart";
 

main() {
  check(r"(?=(a+))", "baaabac", 1, ["", "aaa"]);
  check(r"(?=(a+))a*b\1", "baaabac", 3, ["aba", "a"]);
  check(r"[Jj]ava([Ss]cript)?(?=\:)", "just Javascript: the way 0f jedi", 5,
      ["Javascript", "script"]);
  check(r"[Jj]ava([Ss]cript)?(?=\:)", "taste of java: the cookbook", 9,
      ["java", null]);
  checkNeg(r"[Jj]ava([Ss]cript)?(?=\:)", "rhino is JavaScript engine");
  checkNeg(r"a(?=b)a", "aba");
  checkNeg(r"(?=a)b\1", "aabb");
}

void check(String pattern, String str, int matchPos,
    List<String> expectedGroups) {
  RegExp re = new RegExp(pattern);
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

void checkNeg(String pattern, String str) {
  RegExp re = new RegExp(pattern);
  if(null != re.firstMatch(str)) {
    Expect.fail("\"$pattern\" ~ \"$str\"");
  }
}

void checkEx(String pattern, String str) {
  bool fail = false;
  try {
    RegExp re = new RegExp(pattern);
    re.firstMatch(str);
    fail = true;
  } catch(ok) {}
  if(fail == true) {
    Expect.fail("An error expected");
  }
}

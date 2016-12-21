/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 15.10.2.7: The production QuantifierPrefix :: {DecimalDigits,
 *            DecimalDigits}
 *            evaluates by returning MVs of the first and second DecimalDigits,
 *            respectively.
 * @description Checks that this quantifier is applied correctly in various
 *              scenarios.
 * @3rdparty sputnik-v1:S15.10.2.7_A1_T1.js-S15.10.2.7_A1_T12.js
 * @author rodionov
 */
import "../../../../Utils/expect.dart";
 

main() {
  check(r"\d{2,4}", "the answer is 42",14, ["42"]);
  checkNeg(r"\d{2,4}", "the 7 movie");
  check(r"\d{2,4}", "the 20000 Leagues Under the Sea book", 4, ["2000"]);
  check(r"\d{2,4}", "the Fahrenheit 451 book", 15, ["451"]);
  check(r"\d{2,4}", "the 1984 novel", 4, ["1984"]);
  check(r"\d{2,4}", "0a0\u0031\u0031b", 2, ["011"]);
  check(r"\d{2,4}", "0a0\u0031\u003122b", 2, ["0112"]);
  check(r"b{2,3}c", "aaabbbbcccddeeeefffff", 4, ["bbbc"]);
  checkNeg(r"b{42,93}c", "aaabbbbcccddeeeefffff");
  check(r"b{0,93}c", "aaabbbbcccddeeeefffff", 3, ["bbbbc"]);
  check(r"bx{0,93}c", "aaabbbbcccddeeeefffff", 6, ["bc"]);
  check(r".{0,93}", "weirwerdf", 0, ["weirwerdf"]);
  check(r"((12){2,3}).?.?(\1{0,3})", "12121212121212", 0, ["12121212121212",
  "121212", "12", "121212"]);
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

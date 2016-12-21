/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 15.10.2.7: The production QuantifierPrefix :: + evaluates by
 *            returning the two results 1 and infinity.
 * @description Checks that this quantifier is applied correctly in various
 *              scenarios.
 * @3rdparty sputnik-v1:S15.10.2.7_A3_T1.js-S15.10.2.7_A3_T14.js
 * @author rodionov
 */
import "../../../../Utils/expect.dart";
 

main() {
  check(r"\s+java\s+", "language  java\n", 8, ["  java\n"]);
  check(r"\s+java\s+", "\t java object", 0, ["\t java "]);
  checkNeg(r"\s+java\s+", "\t javax package");
  checkNeg(r"\s+java\s+", "java\n\nobject");
  check(r"[a-z]+\d+", "x 2 ff 55 x2 as1 z12 abc12.0", 10, ["x2"]);
  check(r"[a-z]+\d+", "__abc123.0", 2, ["abc123"]);
  check(r"[a-z]+(\d+)", "x 2 ff 55 x2 as1 z12 abc12.0", 10, ["x2", "2"]);
  check(r"[a-z]+(\d+)", "__abc123.0", 2, ["abc123", "123"]);
  check("d+", "abcdddddefg", 3, ["ddddd"]);
  checkNeg("o+", "abcdddddefg");
  check("d+", "abcdefg", 3, ["d"]);
  check("(b+)(b+)(b+)", "abbbbbbbc", 1, ["bbbbbbb", "bbbbb", "b", "b"]);
  check("(b+)(b*)", "abbbbbbbc", 1, ["bbbbbbb", "bbbbbbb", ""]);
  check("b*b+", "abbbbbbbc", 1, ["bbbbbbb"]);
}

void check(String pattern, String str, [int matchPos = -1,
    List<String> expectedGroups = null]) {
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

/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 15.10.2.7: The production QuantifierPrefix :: * evaluates by
 *            returning the two results 0 and infinity.
 * @description Checks that this quantifier is applied correctly in various
 *              scenarios.
 * @3rdparty sputnik-v1:S15.10.2.7_A4_T1.js-S15.10.2.7_A4_T19.js
 * @author rodionov
 */
import "../../../../Utils/expect.dart";
 

main() {
  check("[^\"]*", "\"beast\"-nickname", 0, [""]);
  check("[^\"]*", "alice said: \"don\'t\"", 0, ["alice said: "]);
  check("[^\"]*", "before\'i\'start", 0, ["before\'i\'start"]);
  check("[^\"]*", "alice \"sweep\": \"don\'t\"", 0, ["alice "]);
  check("[^\"]*", "alice \u0022sweep\u0022: \"don\'t\"", 0, ["alice "]);
  check("[\"\'][^\"\']*[\"\']", "alice \u0022sweep\u0022: \"don\'t\"", 6,
      ["\"sweep\""]);
  check("[\"\'][^\"\']*[\"\']", "alice cries out: \'don\'t\'", 17, ["\'don\'"]);
  checkNeg("[\"\'][^\"\']*[\"\']", "alice cries out: don\'t");
  check("[\"\'][^\"\']*[\"\']", "alice cries out: \"\"", 17, ["\"\""]);
  check("d*", "abcddddefg", 0, [""]);
  check("cd*", "abcddddefg", 2, ["cdddd"]);
  check("cx*d", "abcddddefg", 2, ["cd"]);
  check("(x*)(x+)", "xxxxxxx", 0, ["xxxxxxx", "xxxxxx", "x"]);
  check(r"(\d*)(\d+)", "0123456789", 0, ["0123456789", "012345678", "9"]);
  check(r"(\d*)\d(\d+)", "0123456789", 0, ["0123456789", "01234567", "9"]);
  check("(x+)(x*)", "xxxxxxx", 0, ["xxxxxxx", "xxxxxxx", ""]);
  check(r"x*y+$", "xxxxxxyyyyyy", 0, ["xxxxxxyyyyyy"]);
  check(r"[\d]*[\s]*bc.", "abcdef", 1, ["bcd"]);
  check(r"bc..[\d]*[\s]*", "abcdef", 1, ["bcde"]);
  check(".*", "a1b2c3", 0, ["a1b2c3"]);
  checkNeg("[xyz]*1", "a0.b2.c3");
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

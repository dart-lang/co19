/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 15.10.2.7: The production QuantifierPrefix :: {DecimalDigits, }
 *            evaluates by returning MV of DecimalDigits and infinity.
 * @description Checks that this quantifier is applied correctly in various
 *              scenarios.
 * @3rdparty sputnik-v1:S15.10.2.7_A6_T1.js-S15.10.2.7_A6_T6.js
 * @author rodionov
 */
import "../../../../Utils/expect.dart";
 

main() {
  check(r"b{2,}c", "aaabbbbcccddeeeefffff",3, ["bbbbc"]);
  checkNeg(r"b{8,}c", "aaabbbbcccddeeeefffff");
  check(r"\d{1,}", "wqe456646dsff", 3, ["456646"]);
  check(r"(123){1,}", "123123", 0, ["123123", "123"]);
  check(r"(123){1,}?", "123123", 0, ["123", "123"]);
  check(r"(123){1,}x\1", "123123x123", 0, ["123123x123", "123"]);
  check(r"x{1,2}x{1,}", "xxxxxxx", 0, ["xxxxxxx"]);
  check(r"(a{1,2})\1{1,}", "aaaaaaaa", 0, ["aaaaaaaa", "aa"]);
  check(r"(a{1,2})\1{1,}", "aaaaaaaaa", 0, ["aaaaaaaa", "aa"]);
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

/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 15.10.2.9: An escape sequence of the form \ followed by a nonzero
 *            decimal number n matches the result of the Nth set of capturing
 *            parentheses (see 15.10.2.11). It is an error if the regular
 *            expression has fewer than n capturing parentheses. If the regular
 *            expression has n or more capturing parentheses but the Nth one is
 *            undefined because it has not captured anything, then the
 *            backreference always succeeds.
 * @description Checks that backreferences work as specified.
 * @3rdparty sputnik-v1:S15.10.2.9_A1_T1.js-S15.10.2.9_A1_T5.js
 * @author rodionov
 */
import "../../../../Utils/expect.dart";
 

main() {
  check(r"\b(\w+) \1\b", "do you listen the the band", 14, ["the the", "the"]);
  check(r"([xu]\d{2}([A-H]{2})?)\1", "x09x12x01x01u00FFu00FFx04x04x23", 6,
      ["x01x01", "x01", null]);
  check(r"([xu]\d{2}([A-H]{2})?)\1", "x09x12x01x05u00FFu00FFx04x04x23", 12,
      ["u00FFu00FF", "u00FF", "FF"]);
  check(r"(a*)b\1+", "baaac", 0, ["b", ""]);
  checkNeg(r"(a*)b\2", "aaaaaaaaab");
}

void check(String pattern, String str, int matchPos,
    List<String> expectedGroups) {
  RegExp re = new RegExp(pattern);
  Match fm = re.firstMatch(str);
  if (null == fm) {
    Expect.fail("\"$pattern\" !~ \"$str\"");
  }
  if (matchPos >= 0) {
    Expect.equals(matchPos, fm.start);
  }
  if (null != expectedGroups) {
    Expect.equals(expectedGroups.length, fm.groupCount + 1);
    
    for (int i = 0; i <= fm.groupCount; i++) {
      String expGr = expectedGroups[i];
      String actGr = fm.group(i);
      Expect.equals(expGr, actGr, "Mismatch at group $i: \"$expGr\" expected instead of \"$actGr\"");
    }
  }
}

void checkNeg(String pattern, String str) {
  RegExp re = new RegExp(pattern);
  if(null != re.firstMatch(str)) {
    Expect.fail("\"$pattern\" ~ \"$str\"");
  }
}

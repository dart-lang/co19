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
 * @needsreview
 */
 

main() {
  check(@"\b(\w+) \1\b", "do you listen the the band", "", 14, ["the the", "the"]);
  check(@"([xu]\d{2}([A-H]{2})?)\1", "x09x12x01x01u00FFu00FFx04x04x23", "", 6, ["x01x01", "x01", ""]);
  check(@"([xu]\d{2}([A-H]{2})?)\1", "x09x12x01x05u00FFu00FFx04x04x23", "", 12, ["u00FFu00FF", "u00FF", "FF"]);
  check(@"(a*)b\1+", "baaac", "", 0, ["b", ""]);
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

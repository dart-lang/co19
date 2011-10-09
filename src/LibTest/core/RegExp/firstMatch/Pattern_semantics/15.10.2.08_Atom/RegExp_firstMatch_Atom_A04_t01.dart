/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 15.10.2.8: To inhibit the capturing behaviour of parentheses, use
 *            the form (?: Disjunction ) instead.
 * @description Checks that the contents of parentheses are not captured when using (?:) syntax.
 * @3rdparty sputnik-v1:S15.10.2.8_A3_T1.js-S15.10.2.8_A3_T33.js
 * @author rodionov
 */
 

main() {
  int parens = 200;
  StringBuffer ptrn = new StringBuffer();
  for(int i = 0; i < parens; i++) {
    ptrn.add("(?:");
  }
  ptrn.add("hello");
  for(int i = 0; i < parens; i++) {
    ptrn.add(")");
  }
  check(ptrn.toString(), "hello", "", 0, ["hello"]);
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

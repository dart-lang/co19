/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 15.10.2.8: To inhibit the capturing behaviour of parentheses, use
 *            the form (?: Disjunction ) instead.
 * @description Checks that the contents of parentheses are not captured when
 * using (?:) syntax.
 * @3rdparty sputnik-v1:S15.10.2.8_A3_T1.js-S15.10.2.8_A3_T33.js
 * @author rodionov
 */
import "../../../../Utils/expect.dart";
 

main() {
  int parens = 200;
  StringBuffer ptrn = new StringBuffer();
  for(int i = 0; i < parens; i++) {
    ptrn.write("(?:");
  }
  ptrn.write("hello");
  for(int i = 0; i < parens; i++) {
    ptrn.write(")");
  }
  check(ptrn.toString(), "hello", 0, ["hello"]);
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

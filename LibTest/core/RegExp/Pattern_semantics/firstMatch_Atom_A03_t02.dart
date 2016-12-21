/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 15.10.2.8: Parentheses of the form ( Disjunction ) serve both to
 *            group the components of the Disjunction pattern together and to
 *            save the result of the match. The result can be used either in a
 *            backreference (\ followed by a nonzero decimal number), referenced
 *            in a replace String, or returned as part of a list from the
 *            regular expression matching internal procedure.
 * @description Checks nested parentheses.
 * @3rdparty sputnik-v1:S15.10.2.8_A3_T1.js-S15.10.2.8_A3_T33.js
 * @author rodionov
 */
import "../../../../Utils/expect.dart";
 

main() {
  int parens = 200;
  StringBuffer ptrn = new StringBuffer();
  for(int i = 0; i < parens; i++) {
    ptrn.write("(");
  }
  ptrn.write("hello");
  for(int i = 0; i < parens; i++) {
    ptrn.write(")");
  }
  List<String> exp = new List<String>(parens + 1);
  for(int i = 0; i < exp.length; i++) {
    exp[i] = "hello";
  }
  check(ptrn.toString(), "hello", 0, exp);
}

void check(String pattern, String str, int matchPos, List<String> expectedGroups) {
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

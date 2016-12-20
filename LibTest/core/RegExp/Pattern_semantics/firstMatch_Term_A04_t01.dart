/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 15.10.2.5: Once the minimum number of repetitions has been
 *            satisfied, any more expansions of Atom that match the empty String
 *            are not considered for further repetitions. This prevents the
 *            regular expression engine from falling into an infinite loop on
 *            certain patterns.
 * @description Checks that the infinite loops are indeed avoided (no stack
 *              overflow or other errors occur).
 * @author rodionov
 */
import "../../../../Utils/expect.dart";
 

main() {
  check(r"(a*)b\1+", "baaaac", ["b", ""]);
  check(r"(a*)*", "b", ["", null]);
}

void check(String pattern, String str, List<String> expectedGroups) {
  RegExp re = new RegExp(pattern);
  Match fm = re.firstMatch(str);
  if(null == fm) {
    Expect.fail("\"$pattern\" !~ \"$str\"");
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


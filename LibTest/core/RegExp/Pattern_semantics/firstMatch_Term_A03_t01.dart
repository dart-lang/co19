/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 15.10.2.5: Atom's captures are cleared each time Atom is repeated.
 * @description Checks that the assertion is true.
 * @3rdparty sputnik-v1:S15.10.2.5_A1_T4.js
 * @author rodionov
 * @reviewer msyabro
 * @note issue 1290
 */
import "../../../../Utils/expect.dart";
 

main() {
  check("(z)((a+)?(b+)?(c))*", "zaacbbbcac", ["zaacbbbcac", "z", "ac", "a",
    null, "c"]);
  check("(z)((a+)?(b+)?(c))*", "zaacbbbc", ["zaacbbbc", "z", "bbbc", null,
    "bbb", "c"]);
}

void check(String pattern, String str,  List<String> expectedGroups) {
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


/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 15.10.2.5: If the Atom and the sequel of the regular
 *            expression all have choice points, the Atom is first matched as
 *            many (or as few, if non-greedy) times as possible. All choices in
 *            the sequel are tried before moving on to the next choice in the
 *            last repetition of Atom. All choices in the last (Nth) repetition
 *            of Atom are tried before moving on to the next choice in the
 *            next-to-last (N-1)st repetition of Atom; at which point it may
 *            turn out that more or fewer repetitions of Atom are now possible;
 *            these are exhausted (again, starting with either as few or as many
 *            as possible) before moving on to the next choice in the (N-1)st
 *            repetition of Atom and so on.
 * @description Checks that matches are ordered according to this rule.
 * @3rdparty sputnik-v1:S15.10.2.5_A1_T3.js-S15.10.2.5_A1_T2.js
 * @author rodionov
 */
import "../../../../Utils/expect.dart";
 

main() {
  check("(aa|aabaac|ba|b|c)*", "aabaac", ["aaba", "ba"]);
  check(r"^(a+)\1*,\1+$", "aaaaaaaaa,aaaaaa", ["aaaaaaaaa,aaaaaa", "aaa"]);
  check(r"^(a+)\1*,\1+$", "aaaaaa,aaaaaaaaa", ["aaaaaa,aaaaaaaaa", "aaa"]);
  check(r"^(a+?)\1*,\1+$", "aaaaaaaaa,aaaaaa", ["aaaaaaaaa,aaaaaa", "a"]);
  check(r"^(a+?)\1*,\1+$", "aaaaaa,aaaaaaaaa", ["aaaaaa,aaaaaaaaa", "a"]);
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
      //print("\t$expGr == $actGr ??");
      if(expGr != actGr) {
        Expect.fail("Mismatch at group $i: \"$expGr\" expected instead of \"$actGr\"");
      }
    }
  }
}

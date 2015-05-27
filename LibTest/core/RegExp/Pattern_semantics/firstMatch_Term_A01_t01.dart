/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 15.10.2.5: An Atom followed by a Quantifier is repeated the
 *            number of times specified by the Quantifier. A Quantifier can be
 *            non-greedy, in which case the Atom pattern is repeated as few
 *            times as possible while still matching the sequel, or it can be
 *            greedy, in which case the Atom pattern is repeated as many times
 *            as possible while still matching the sequel. The Atom pattern is
 *            repeated rather than the input String that it matches, so
 *            different repetitions of the Atom can match different input
 *            substrings.
 * @description Checks that greedy and non-greedy quantifiers work as expected.
 * @3rdparty sputnik-v1:S15.10.2.5_A1_T1.js-S15.10.2.5_A1_T2.js
 * @author rodionov
 * @reviewer msyabro
 */
import "../../../../Utils/expect.dart";
 

main() {
  check("a[a-z]{2,4}", "abcdefghi", ["abcde"]);
  check("a[a-z]{2,4}?", "abcdefghi", ["abc"]);
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


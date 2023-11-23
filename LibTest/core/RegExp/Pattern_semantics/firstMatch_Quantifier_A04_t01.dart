// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion 15.10.2.7: The production QuantifierPrefix :: {DecimalDigits}
/// evaluates by returning the MV of DecimalDigits.
/// @description Checks that this quantifier is applied correctly in various
/// scenarios.
/// @3rdparty sputnik-v1:S15.10.2.7_A2_T1.js-S15.10.2.7_A2_T4.js
/// @author rodionov

import "../../../../Utils/expect.dart";
 

main() {
  check(r"[a-zA-Z]{3}\d{2}", "xa124dfdg08", 6, ["fdg08"]);
  check(r"b{2}c", "aaabbbbcccddeeeefffff", 5, ["bbc"]);
  checkNeg(r"b{8}", "aaabbbbcccddeeeefffff");
}

void check(String pattern, String str, int matchPos, List<String>? expGroups) {
  RegExp re = new RegExp(pattern);
  Expect.isNotNull(re.firstMatch(str), "\"$pattern\" !~ \"$str\"");
  Match fm = re.firstMatch(str) as Match;
  if(matchPos >= 0) {
    Expect.equals(matchPos, fm.start);
  }
  if(null != expGroups) {
    Expect.equals(expGroups.length, fm.groupCount + 1);
    
    for(int i = 0; i <= fm.groupCount; i++) {
      String? expGr = expGroups[i];
      String? actGr = fm.group(i);
      Expect.equals(expGr, actGr,
          "Mismatch at group $i: \"$expGr\" expected instead of \"$actGr\"");
    }
  }
}

void checkNeg(String pattern, String str) {
  RegExp re = new RegExp(pattern);
  Expect.isNull(re.firstMatch(str), "\"$pattern\" ~ \"$str\"");
}

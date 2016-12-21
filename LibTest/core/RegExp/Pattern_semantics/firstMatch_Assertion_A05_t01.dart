/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Since the assertions ^, $, \b and \B do not change endIndex,
 *            multiple subsequent occurrences of the same one are equivalent to
 *            a single assertion.
 * @description Checks that the assertion is true.
 * @3rdparty sputnik-v1:S15.10.2.6_A5_T1.js-S15.10.2.6_A5_T2.js
 * @author rodionov
 */
import "../../../../Utils/expect.dart";
 

main() {
  check(r"^^^^^^^\b\b\b\bro\B\B\B\Bbot\b\b\b\b\b$$$$", "robot", 0);
}

void check(String pattern, String str, int matchPos) {
  RegExp re = new RegExp(pattern);
  Match fm = re.firstMatch(str);
  if(null == fm) {
    Expect.fail("\"$pattern\" !~ \"$str\"");
  }
  if(matchPos >= 0) {
    Expect.equals(matchPos, fm.start);
  }
}

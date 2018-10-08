/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 15.10.2.8: The production Atom :: . evaluates as follows:
 *            <ol>
 *            <li>Let A be the set of all characters except LineTerminator.
 *            </li>
 *            <li>Call CharacterSetMatcher(A, false) and return its Matcher
 *            result.</li>
 *            </ol>
 * @description Checks that this Atom is handled correctly.
 * @3rdparty sputnik-v1:S15.10.2.8_A4_T1.js-S15.10.2.8_A4_T9.js
 * @author rodionov
 */
import "../../../../Utils/expect.dart";
 

main() {
  check(r"ab.de", "abcde", 0, ["abcde"]);
  check(r".+", "line 1\nline 2", 0, ["line 1"]);
  check(r".*a.*", "this is a test", 0, ["this is a test"]);
  check(r".+", r"this is a *&^%$# test", 0, [r"this is a *&^%$# test"]);
  check(r".+", "....", 0, ["...."]);
  check(r".+", "abcdefghijklmnopqrstuvwxyz", 0, ["abcdefghijklmnopqrstuvwxyz"]);
  check(r".+", "ABCDEFGHIJKLMNOPQRSTUVWXYZ", 0, ["ABCDEFGHIJKLMNOPQRSTUVWXYZ"]);
  check(r".+", r"`1234567890-=~!@#$%^&*()_+", 0,
      [r"`1234567890-=~!@#$%^&*()_+"]);
  check(r".+", r"""|\[{]};:"',<>.?/""", 0, [r"""|\[{]};:"',<>.?/"""]);
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

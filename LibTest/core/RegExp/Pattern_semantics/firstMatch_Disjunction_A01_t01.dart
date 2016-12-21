/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 15.10.2.3: The | regular expression operator separates two
 *            alternatives. The pattern first tries to match the left
 *            Alternative (followed by the sequel of the regular expression); if
 *            it fails, it tries to match the right Disjunction (followed by the
 *            sequel of the regular expression). If the left Alternative, the
 *            right Disjunction, and the sequel all have choice points, all
 *            choices in the sequel are tried before moving on to the next
 *            choice in the left Alternative. If choices in the left Alternative
 *            are exhausted, the right Disjunction is tried instead of the left
 *            Alternative. Any capturing parentheses inside a portion of the
 *            pattern skipped by | produce undefined values instead of Strings.
 * @description Checks that a valid disjunction pattern works as described and
 * that the captured groups have correct values.
 * @3rdparty sputnik-v1:S15.10.2.3_A1_T1.js-S15.10.2.3_A1_T17.js
 * @author rodionov
 */
import "../../../../Utils/expect.dart";

main() {
  check("a|ab", "abc");
  check("\\d{3}|[a-z]{4}", "2, 12 and of course repeat 12");
  checkNeg("\\d{3}|[a-z]{4}", "2, 12 and 23 AND 0.00.1");
  check("ab|cd|ef", "AEKFCD", ignoreCase: true);
  checkNeg("ab|cd|ef", "AEKFCD");
  check("11111|111", "1111111111111111");
  check("xyz|...", "abc");
  check("(ab|cd)+|ef", "AEKFCD",
      ignoreCase: true, expectedGroups: ["CD", "CD"]);
  check("(ab|cd)+|ef", "AEKFCDab",
      ignoreCase: true, expectedGroups: ["CDab", "ab"]);
  check("(ab|cd)+|ef", "AEKeFCDab",
      ignoreCase: true, expectedGroups: ["eF", null]);
  check("(.)..|abc", "abc", expectedGroups: ["abc", "a"]);
  check(".+: gr(a|e)y", "color: grey", expectedGroups: ["color: grey", "e"]);
  check("(Rob)|(Bob)|(Robert)|(Bobby)", "Hi Bob",
      expectedGroups: ["Bob", null, "Bob", null, null]);
  check("()|", "", expectedGroups: ["", ""]);
  check("|()", "", expectedGroups: ["", null]);
  check("((a)|(ab))((c)|(bc))", "abc",
      expectedGroups: ["abc", "a", "a", null, "bc", null, "bc"]);
  check("((a)|(b))c", "aebc", expectedGroups: ["bc", "b", null, "b"]);
}

void check(String pattern, String str,
    {bool multiLine: false,
    bool ignoreCase: false,
    List<String> expectedGroups: null}) {
  RegExp re =
      new RegExp(pattern, multiLine: multiLine, caseSensitive: !ignoreCase);
  Match fm = re.firstMatch(str);
  if (null == fm) {
    Expect.fail("\"$pattern\" !~ \"$str\"");
  }
  if (null != expectedGroups) {
    Expect.equals(expectedGroups.length, fm.groupCount + 1);

    for (int i = 0; i <= fm.groupCount; i++) {
      String expGr = expectedGroups[i];
      String actGr = fm.group(i);
      if (expGr != actGr) {
        Expect.fail(
            "Mismatch at group $i: \"$expGr\" expected instead of \"$actGr\"");
      }
    }
  }
}

void checkNeg(String pattern, String str) {
  RegExp re = new RegExp(pattern);
  if (null != re.firstMatch(str)) {
    Expect.fail("\"$pattern\" ~ \"$str\"");
  }
}

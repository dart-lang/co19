/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 15.10.2.6: The production Assertion :: ^ evaluates by returning an
 *            internal AssertionTester closure that takes a State argument x and
 *            performs the following:
 *            <ol>
 *            <li>Let e be x's endIndex. </li>
 *            <li>If e is zero, return true. </li>
 *            <li>If Multiline is false, return false. </li>
 *            <li>If the character Input[e-1] is one of LineTerminator, return
 *            true.</li>
 *            <li>Return false.</li>
 *            </ol>
 * @description Checks that the ^ assertion is interpreted correctly.
 * @3rdparty sputnik-v1:S15.10.2.6_A2_T1.js-S15.10.2.6_A2_T10.js
 * @author rodionov
 */
import "../../../../Utils/expect.dart";
 

main() {
  checkNeg("^m", "pairs\nmakes\tdouble");
  check("^m", "pairs\nmakes\tdouble", multiLine: true);
  check(r"^\d+", "abc\n123xyz", multiLine: true);
  check("^p[a-z]", "pairs\nmakes\tdouble\npesos");
  checkNeg("^p[b-z]", "pairs\nmakes\tdouble\npesos");
  check("^p[b-z]", "pairs\nmakes\tdouble\npesos", multiLine: true);
  check("^[^p]", "pairs\nmakes\tdouble\npesos", multiLine: true);
  check("^ab", "abcde");
  checkNeg("^..^e", "ab\ncde");
  checkNeg("^xxx", "yyyyy");
  check(r"^\^+", "^^^x");
}

void check(String pattern, String str, {bool multiLine: false,
    bool ignoreCase: false}) {
  RegExp re = new RegExp(pattern, multiLine: multiLine,
      caseSensitive: !ignoreCase);
  Match fm = re.firstMatch(str);
  if(null == fm) {
    Expect.fail("\"$pattern\" !~ \"$str\"");
  }
}

void checkNeg(String pattern, String str, {bool multiLine: false,
    bool ignoreCase: false}) {
  RegExp re = new RegExp(pattern, multiLine: multiLine,
      caseSensitive: !ignoreCase);
  if(null != re.firstMatch(str)) {
    Expect.fail("\"$pattern\" ~ \"$str\"");
  }
}

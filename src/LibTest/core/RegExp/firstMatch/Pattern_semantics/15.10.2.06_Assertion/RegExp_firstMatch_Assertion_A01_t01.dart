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
 * @description Checks that the ^ assertion is interpreted correctly
 * @3rdparty sputnik-v1:S15.10.2.6_A2_T1.js-S15.10.2.6_A2_T10.js
 * @author rodionov
 */
 

main() {
  checkNeg("^m", "pairs\nmakes\tdouble", "");
  check("^m", "pairs\nmakes\tdouble", "m");
  check(@"^\d+", "abc\n123xyz", "m");
  check("^p[a-z]", "pairs\nmakes\tdouble\npesos", "");
  checkNeg("^p[b-z]", "pairs\nmakes\tdouble\npesos", "");
  check("^p[b-z]", "pairs\nmakes\tdouble\npesos", "m");
  check("^[^p]", "pairs\nmakes\tdouble\npesos", "m");
  check("^ab", "abcde", "");
  checkNeg("^..^e", "ab\ncde", "");
  checkNeg("^xxx", "yyyyy", "");
  check(@"^\^+", "^^^x", "");
}

void check(String pattern, String str, String flags = "") {
  RegExp re = new RegExp(pattern, flags);
  Match fm = re.firstMatch(str);
  if(null == fm) {
    Expect.fail("\"$pattern\" !~ \"$str\"");
  }
}

void checkNeg(String pattern, String str, String flags = "") {
  RegExp re = new RegExp(pattern, flags);
  if(null != re.firstMatch(str)) {
    Expect.fail("\"$pattern\" ~ \"$str\"");
  }
}

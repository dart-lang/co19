/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 15.10.2.6: The production Assertion :: \ B evaluates by returning
 *            an internal AssertionTester closure that takes a State argument x
 *            and performs the following:
 *            <ol>
 *            <li>Let e be x's endIndex.</li>
 *            <li>Call IsWordChar(e-1) and let a be the Boolean result.</li>
 *            <li>Call IsWordChar(e) and let b be the Boolean result.</li>
 *            <li>If a is true and b is false, return false.</li>
 *            <li>If a is false and b is true, return false.</li>
 *            <li>Return true. </li>
 *            </ol>
 *            The abstract operation IsWordChar(e) returns true if and only if
 *            its argument is between -1 and InputLength (exclusive) and the
 *            input character at the position specified by e is one of: latin
 *            letters (both cases), arabic numerals or the underscore.
 * @description Checks that the \B assertion is interpreted correctly
 * @3rdparty sputnik-v1:S15.10.2.6_A4_T1.js-S15.10.2.6_A4_T8.js
 * @author rodionov
 */
 

main() {
  check(@"\Bevil\B", "devils arise\tfor\nevil", "", 1);
  check(@"[f-z]e\B", "devils arise\tfor\nrevil", "", 17);
  check(@"\Bo\B", "devils arise\tfOr\nrevil", "i", 14);
  check(@"\B\w\B", "devils arise\tfor\nrevil", "", 1);
  check(@"\w\B", "devils arise\tfor\nrevil", "", 0);
  check(@"\B\w", "devils arise\tfor\nrevil", "", 1);
  checkNeg(@"\B[a-yA-Y]{4}\B", "devil arise\tforzzx\nevils");
  check(@"\B\w{4}\B", "devil arise\tforzzx\nevils", "", 13);
}

void check(String pattern, String str, String flags = "", int matchPos = -1) {
  RegExp re = new RegExp(pattern, flags);
  Match fm = re.firstMatch(str);
  if(null == fm) {
    Expect.fail("\"$pattern\" !~ \"$str\"");
  }
  if(matchPos >= 0) {
    Expect.equals(matchPos, fm.start(0));
  }
}

void checkNeg(String pattern, String str, String flags = "") {
  RegExp re = new RegExp(pattern, flags);
  if(null != re.firstMatch(str)) {
    Expect.fail("\"$pattern\" ~ \"$str\"");
  }
}

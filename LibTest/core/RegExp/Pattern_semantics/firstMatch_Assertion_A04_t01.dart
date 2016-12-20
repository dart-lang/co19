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
 * @description Checks that the \B assertion is interpreted correctly.
 * @3rdparty sputnik-v1:S15.10.2.6_A4_T1.js-S15.10.2.6_A4_T8.js
 * @author rodionov
 */
import "../../../../Utils/expect.dart";
 

main() {
  check(r"\Bevil\B", "devils arise\tfor\nevil", matchPos: 1);
  check(r"[f-z]e\B", "devils arise\tfor\nrevil",  matchPos: 17);
  check(r"\Bo\B", "devils arise\tfOr\nrevil", ignoreCase: true, matchPos: 14);
  check(r"\B\w\B", "devils arise\tfor\nrevil", matchPos: 1);
  check(r"\w\B", "devils arise\tfor\nrevil", matchPos: 0);
  check(r"\B\w", "devils arise\tfor\nrevil", matchPos: 1);
  checkNeg(r"\B[a-yA-Y]{4}\B", "devil arise\tforzzx\nevils");
  check(r"\B\w{4}\B", "devil arise\tforzzx\nevils", matchPos: 13);
}

void check(String pattern, String str, {bool multiLine: false,
    bool ignoreCase: false, int matchPos: -1}) {
  RegExp re = new RegExp(pattern, multiLine: multiLine,
      caseSensitive: !ignoreCase);
  Match fm = re.firstMatch(str);
  if(null == fm) {
    Expect.fail("\"$pattern\" !~ \"$str\"");
  }
  if(matchPos >= 0) {
    Expect.equals(matchPos, fm.start);
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

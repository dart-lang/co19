/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 15.10.2.6: The production Assertion :: \ b evaluates by returning
 *            an internal AssertionTester closure that takes a State argument x
 *            and performs the following:
 *            <ol>
 *            <li>Let e be x's endIndex.</li>
 *            <li>Call IsWordChar(e-1) and let a be the Boolean result.</li>
 *            <li>Call IsWordChar(e) and let b be the Boolean result.</li>
 *            <li>If a is true and b is false, return true.</li>
 *            <li>If a is false and b is true, return true.</li>
 *            <li>Return false. </li>
 *            </ol>
 *            The abstract operation IsWordChar(e) returns true if and only if
 *            its argument is between -1 and InputLength (exclusive) and the
 *            input character at the position specified by e is one of: latin
 *            letters (both cases), arabic numerals or the underscore.
 * @description Checks that the \b assertion is interpreted correctly
 * @3rdparty sputnik-v1:S15.10.2.6_A3_T1.js-S15.10.2.6_A3_T15.js
 * @author rodionov
 */
 

main() {
  check(@"\bp", "pilot\nsoviet robot\topenoffice", "", 0);
  check(@"ot\b", "pilot\nsoviet robot\topenoffice", "", 3);
  checkNeg(@"\bot", "pilot\nsoviet robot\topenoffice", "");
  check(@"\bso", "pilot\nsoviet robot\topenoffice", "", 6);
  checkNeg(@"so\b", "pilot\nsoviet robot\topenoffice", "");
  check(@"[^o]t\b", "pilOt\nsoviet robot\topenoffice", "", 3);
  check(@"[^o]t\b", "pilOt\nsoviet robot\topenoffice", "i", 10);
  check(@"\bro", "pilot\nsoviet robot\topenoffice", "", 13);
  checkNeg(@"r\b", "pilot\nsoviet robot\topenoffice", "");
  check(@"\brobot\b", "pilot\nsoviet robot\topenoffice", "", 13);
  check(@"\b\w{5}\b", "pilot\nsoviet robot\topenoffice", "", 0);
  check(@"\bop", "pilot\nsoviet robot\topenoffice", "", 19);
  checkNeg(@"op\b", "pilot\nsoviet robot\topenoffice", "");
  check(@"e\b", "pilot\nsoviet robot\topenoffic\u0065", "", 28);
  checkNeg(@"\be", "pilot\nsoviet robot\topenoffic\u0065", "");
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

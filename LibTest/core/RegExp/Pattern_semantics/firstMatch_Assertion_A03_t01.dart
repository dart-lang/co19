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
 * @description Checks that the \b assertion is interpreted correctly.
 * @3rdparty sputnik-v1:S15.10.2.6_A3_T1.js-S15.10.2.6_A3_T15.js
 * @author rodionov
 */
import "../../../../Utils/expect.dart";
 

main() {
  check(r"\bp", "pilot\nsoviet robot\topenoffice",  matchPos: 0);
  check(r"ot\b", "pilot\nsoviet robot\topenoffice", matchPos: 3);
  checkNeg(r"\bot", "pilot\nsoviet robot\topenoffice");
  check(r"\bso", "pilot\nsoviet robot\topenoffice", matchPos: 6);
  checkNeg(r"so\b", "pilot\nsoviet robot\topenoffice");
  check(r"[^o]t\b", "pilOt\nsoviet robot\topenoffice", matchPos: 3);
  check(r"[^o]t\b", "pilOt\nsoviet robot\topenoffice", caseSensitive: false,
      matchPos: 10);
  check(r"\bro", "pilot\nsoviet robot\topenoffice", matchPos: 13);
  checkNeg(r"r\b", "pilot\nsoviet robot\topenoffice");
  check(r"\brobot\b", "pilot\nsoviet robot\topenoffice", matchPos: 13);
  check(r"\b\w{5}\b", "pilot\nsoviet robot\topenoffice", matchPos: 0);
  check(r"\bop", "pilot\nsoviet robot\topenoffice", matchPos: 19);
  checkNeg(r"op\b", "pilot\nsoviet robot\topenoffice");
  check(r"e\b", "pilot\nsoviet robot\topenoffic\u0065", matchPos: 28);
  checkNeg(r"\be", "pilot\nsoviet robot\topenoffic\u0065");
}

void check(String pattern, String str, {bool multiLine: false,
    bool caseSensitive: true, int matchPos: -1}) {
  RegExp re = new RegExp(pattern, multiLine: multiLine,
      caseSensitive: caseSensitive);
  Match fm = re.firstMatch(str);
  if(null == fm) {
    Expect.fail("\"$pattern\" !~ \"$str\"");
  }
  if(matchPos >= 0) {
    Expect.equals(matchPos, fm.start);
  }
}

void checkNeg(String pattern, String str, {bool multiLine: false, bool caseSensitive: true}) {
  RegExp re = new RegExp(pattern, multiLine: multiLine, caseSensitive: caseSensitive);
  if(null != re.firstMatch(str)) {
    Expect.fail("\"$pattern\" ~ \"$str\"");
  }
}

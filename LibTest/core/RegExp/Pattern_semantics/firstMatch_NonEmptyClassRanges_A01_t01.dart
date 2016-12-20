/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 15.10.2.15: The production NonemptyClassRanges :: ClassAtom -
 *            ClassAtom ClassRanges evaluates as follows:
 *            <ol>
 *            <li>Evaluate the first ClassAtom to obtain a CharSet A. </li>
 *            <li>Evaluate the second ClassAtom to obtain a CharSet B.</li>
 *            <li>Evaluate ClassRanges to obtain a CharSet C. </li>
 *            <li>Call CharacterRange(A, B) and let D be the resulting CharSet.
 *            </li>
 *            <li>Return the union of CharSets D and C.</li>
 *            </ol>
 *            <br/> The abstract operation CharacterRange takes two CharSet
 *            parameters A and B and performs the following:
 *            <ol>
 *            <li>If A does not contain exactly one character or B does not
 *            contain exactly one character then throw a SyntaxError exception.
 *            </li>
 *            <li>Let a be the one character in CharSet A. </li>
 *            <li>Let b be the one character in CharSet B. </li>
 *            <li>Let i be the code unit value of character a. </li>
 *            <li>Let j be the code unit value of character b. </li>
 *            <li>If i > j then throw a SyntaxError exception. </li>
 *            <li>Return the set containing all characters numbered i through
 *            j, inclusive.</li>
 *            </ol>
 *            <br/> 15.10.2.19: NOTE A ClassAtom can use any of the escape
 *            sequences that are allowed in the rest of the regular expression
 *            except for \b, \B, and backreferences. Inside a CharacterClass, \b
 *            means the backspace character, while \B and backreferences raise
 *            errors. Using a backreference inside a ClassAtom causes an error.
 * @description Checks that specifying a range using ClassAtoms that evaluate to
 *            more than a single character results in an error.
 * @3rdparty sputnik-v1:S15.10.2.15_A1_T1.js-S15.10.2.15_A1_T41.js
 * @author rodionov
 * @note issue 1298
 */
import "../../../../Utils/expect.dart";
 
main() {
  checkNeg(r"[a-\w]", "a");
  checkNeg(r"[\W-z]", "a");
  checkNeg(r"[\W-\d]", "a");
}

void checkNeg(String pattern, String str) {
  try {
    RegExp re = new RegExp(pattern);
    re.firstMatch(str);
    Expect.fail("FormatException is expected");
  } on FormatException catch(ok) {}
}

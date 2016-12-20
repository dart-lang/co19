/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 15.10.2.11: The production DecimalEscape :: DecimalIntegerLiteral
 *            [lookahead not in DecimalDigit] evaluates as follows:
 *            <ol>
 *            <li>Let i be the MV of DecimalIntegerLiteral.</li>
 *            <li>If i is zero, return the EscapeValue consisting of a <NUL>
 *            character (Unicode value 0000).</li>
 *            <li>Return the EscapeValue consisting of the integer i. </li>
 *            </ol>
 *            NOTE: If \ is followed by a decimal number n whose first digit is
 *            not 0, then the escape sequence is considered to be a
 *            backreference. It is an error if n is greater than the total
 *            number of left capturing parentheses in the entire regular
 *            expression. \0 represents the NUL character and cannot be followed
 *            by a decimal digit.
 * @description Checks that using a backreference with the number that is
 *              greater than the number of left capturing parentheses in the
 *              entire regexp causes an error.
 * @3rdparty sputnik-v1:S15.10.2.11_A1_T2.js,S15.10.2.11_A1_T3.js
 * @author rodionov
 */
import "../../../../Utils/expect.dart";
 
main() {
  checkNeg(r"\1");
  checkNeg(r"\2");
  checkNeg(r"\3");
  checkNeg(r"\4");
  checkNeg(r"\10");
  checkNeg(r"\100");
  checkNeg(r"(A)\2", "AA");
}

void checkNeg(String pattern, [String testStr = ""]) {
  bool fail = false;
  RegExp re = new RegExp(pattern);
  Expect.equals(null, re.firstMatch(testStr));
}

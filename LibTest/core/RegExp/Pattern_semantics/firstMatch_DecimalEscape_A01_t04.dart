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
 * @description Checks that using a correct decimal number doesn't cause any
 *              errors.
 * @3rdparty sputnik-v1:S15.10.2.11_A1_T4.js - S15.10.2.11_A1_T9.js
 * @author rodionov
 */
import "../../../../Utils/expect.dart";
 

main() {
  check(r"(A)\1", "AA");
  check(r"\1(A)", "AA");
  check(r"(A)\1(B)\2", "AABB");
  check(r"\1(A)(B)\2", "ABB");
  check(r"((((((((((A))))))))))\1\2\3\4\5\6\7\8\9\10", "AAAAAAAAAAA");
  check(r"((((((((((A))))))))))\10\9\8\7\6\5\4\3\2\1", "AAAAAAAAAAA");
}

void check(String pattern, String testStr) {
  RegExp re = new RegExp(pattern);
  Expect.isTrue(null != re.firstMatch(testStr));
}

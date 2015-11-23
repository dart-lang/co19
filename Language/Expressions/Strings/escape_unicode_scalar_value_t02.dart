/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Strings support escape sequences for special characters. The
 * escapes are:
 * . . .
 * • \u{HEX_DIGIT_SEQUENCE} is the unicode scalar value represented by the
 *   HEX_DIGIT_SEQUENCE. It is a compile-time error when the value of the
 *   HEX_DIGIT_SEQUENCE is not a valid unicode scalar value.
 * HEX_DIGIT_SEQUENCE:
 *   HEX_DIGIT HEX_DIGIT? HEX_DIGIT? HEX_DIGIT? HEX_DIGIT? HEX_DIGIT?
 * ;
 * @description Checks that it is a compile-time error when the value
 * of the HEX_DIGIT_SEQUENCE is too long.
 * @compile-error
 * @author msyabro
 * @reviewer rodionov
 */

main() {
  try {
    '\u{121341}';
  } catch (e) {}
}

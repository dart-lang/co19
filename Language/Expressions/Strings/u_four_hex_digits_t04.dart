/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error when a non-raw string literal contains
 * a character sequence of the form \u that is not followed by either a
 * sequence of four hexadecimal digits, or by curly brace delimited sequence of
 * hexadecimal digits.
 * @description Checks that it is a compile-time error when a string literal
 * contains a character sequence of the form \u that is followed empty curly
 * braces.
 * @compile-error
 * @author msyabro
 * @reviewer kaigorodov
 */

main() {
  try {
    "empty \u{}";
  } catch (e) {}
}

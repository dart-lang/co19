/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Dart source text is represented as a sequence of Unicode code
 * points.
 * LETTER:
 *   'a' .. 'z' |
 *   'A' .. 'Z'
 * ;
 * DIGIT:
 *   '0' .. '9'
 * ;
 * WHITESPACE:
 *   ('\t' | ' ' | NEWLINE)+
 * ;
 * @description Checks that a hex-encoded unicode value (\u000a) appearing in a
 * single-line comment is not translated to a corresponding unicode symbol
 * (like in Java) and therefore, does not start a new, uncommented line.
 * @author iefremov
 * @reviewer rodionov
 */

main() {
  //\u000a abyrvalg!
}

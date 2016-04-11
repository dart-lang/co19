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
 * @description Checks that Unicode whitespaces other than WHITESPACE are not
 * permitted in the source code.
 * Checks symbol U+000b.
 * @compile-error
 * @author iefremov
 * @reviewer rodionov
 */

main() {
   // U+000b
}

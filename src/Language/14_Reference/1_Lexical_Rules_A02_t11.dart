/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Dart source text is represented as a sequence of Unicode code points normalized
 * to Unicode Normalization Form C.
 * LETTER: 'a' .. 'z' | 'A' .. 'Z' ;
 * DIGIT: '0' .. '9' ;
 * WHITESPACE: ('\t' | ' ' | NEWLINE)+ ;
 * @description Checks that a hex-encoded unicode value (\u000a) appeared in the source text is not translated
 * to the corresponding symbol (as in Java) and therefore produces a compile-time error.
 * @compile-error
 * @author iefremov
 */

main() {
  \u000a
}

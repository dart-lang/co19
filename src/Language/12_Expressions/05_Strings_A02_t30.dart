/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion stringLiteral:
 *   MULTI_LINE_STRING+ |
 *   SINGLE_LINE_STRING+
 * ;
 * MULTI_LINE_STRING:
 *   '"""' STRING CONTENT TDQ* '"""' |
 *   ''''' STRING CONTENT TSQ* ''''' |
 *   '"""'  (~ '"""')* '"""' |
 *   ''''' (~ ''''')* '''''
 * ;
 * STRING CONTENT TDQ:
 *   ~( '\' | '"""' | '$') |
 *   '\' ~( NEWLINE ) |
 *   STRING_INTERPOLATION
 * ;
 * STRING CONTENT TSQ:
 *   ~( '\' | ''''' | '$') |
 *   '\' ~( NEWLINE ) |
 *   STRING_INTERPOLATION
 * ;
 * @description Checks that it is a compile-time error if a multi-line
 * single-quoted string opens with one double quote.
 * @compile-error
 * @author msyabro
 * @reviewer iefremov
 */

main() {
  try {
    "s''';
  } catch(e) {}
}

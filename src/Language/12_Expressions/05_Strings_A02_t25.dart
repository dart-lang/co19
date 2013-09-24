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
 * @description Checks that it is a compile-time error when a raw multi-line
 * double-quotes string literal has fewer than 3 opening quotes.
 * @compile-error
 * @author rodionov
 * @reviewer msyabro
 */

main() {
  try {
    r""foo""";
  } catch(e) {}
}

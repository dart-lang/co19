/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * stringLiteral:
 *   (multilineString | singleLineString)+
 * ;
 * singleLineString:
 *   '"' stringContentDQ* '"' |
 *   ''' stringContentSQ* ''' |
 *   'r' ''' (~( ''' | NEWLINE ))* ''' |
 *   'r' '"' (~( '"' | NEWLINE ))* '"'
 * ;
 * stringContentDQ:
 *   ~( '\' | '"' | '$' | NEWLINE ) |
 *   '\' ~( NEWLINE ) |
 *   stringInterpolation
 * ;
 * stringContentSQ:
 *   ~( '\' | ''' | '$' | NEWLINE ) |
 *   '\' ~( NEWLINE ) |
 *   stringInterpolation
 * ;
 * NEWLINE:
 *   '\n' |
 *   '\r'
 * ;
 * @description Checks that it is a compile-time error when a newline character
 * in a single-line double-quotes string literal is preceded by a backslash
 * character.
 * @compile-error
 * @author msyabro
 * @reviewer rodionov
 * @note http://code.google.com/p/dart/issues/detail?id=1549
 */

main() {
  try {
    "new\
    line";
  } catch (e) {}
}

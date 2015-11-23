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
 * @description Checks that a raw string literal can't begin with a double
 * quote and end with single.
 * @compile-error
 * @author msyabro
 * @reviewer rodionov
 */

main() {
  try {
    r"string';
  } catch (e) {}
}

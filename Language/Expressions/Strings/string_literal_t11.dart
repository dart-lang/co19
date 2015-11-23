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
 * @description Checks that a single-quotes string literal can't contain a
 * single quote character that is not escaped using a backslash character.
 * @compile-error
 * @author msyabro
 * @reviewer rodionov
 */

main() {
  try {
    'invalid ' string';
  } catch (e) {}
}

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
 * @description Checks that a string can contain any unicode new line symbols
 * other than \r and \n.
 * @author msyabro
 * @reviewer iefremov
 */

main() {
  "verticaltab";
  "formfeed";
  "nextline";
  "line separator";
  "paragraph separator";

  'verticaltab';
  'formfeed';
  'nextline';
  'line separator';
  'paragraph separator';

  r"verticaltab";
  r"formfeed";
  r"nextline";
  r"line separator";
  r"paragraph separator";

  r'verticaltab';
  r'formfeed';
  r'nextline';
  r'line separator';
  r'paragraph separator';
}

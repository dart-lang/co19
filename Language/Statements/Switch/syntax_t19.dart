/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The switch statement supports dispatching control among a large
 * number of cases.
 * switchStatement:
 *   switch '(' expression ')' '{' switchCase* defaultCase? '}'
 * ;
 * switchCase:
 *   label* case expression ':' statements
 * ;
 * defaultCase:
 *   label* default ':' statements
 * ;
 * @description Checks that a case clause that contains labeled statement
 * doesn't produce any errors.
 * @author iefremov
 * @reviewer rodionov
 */

main() {
  switch (1) {
    case 0: break;
    label: print("hello"); /// unspecified static warning - unreachable code
  }
}

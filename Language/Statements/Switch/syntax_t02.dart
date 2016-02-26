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
 * @description Checks that a switch statement with all kinds of case
 * expressions (as long as they're allowed by spec) works as expected.
 * @author rodionov
 * @reviewer iefremov
 * @issue 2238
 */

main() {
  switch (1) {
    l1: l2: l3: case (1):
  }
}

/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The switch statement supports dispatching control among a large number of cases.
 * switchStatement:
 * switch '(' expression ')' '{' switchCase* defaultCase? '}'
 * ;
 * switchCase:
 * label* (case expression ':') statements
 * ;
 * defaultCase:
 * label* default ':' statements
 * ;
 * @description Checks that a switch statement with all kinds of case expressions works as expected.
 * @author rodionov
 * @reviewer iefremov
 * @needsreview issue 2238
 */

switchTest(value) {
  var result;
  
  switch(value) {
    case 1:
      {result = 1;}
      break;
      
    label: case 7 << 2:
      result = 2;
      break;

    case 'val':
      result = 3;
      break;
      
    default:
      result = -1;
  }  
  return result;
}

main() {
  Expect.equals(1, switchTest(1));
  Expect.equals(2, switchTest(28));
  Expect.equals(3, switchTest("val"));
  Expect.equals(-1, switchTest(null));
  Expect.equals(-1, switchTest(0));
  Expect.equals(-1, switchTest("abyrvalg"));
  
  switch(1) {
    case 0:
    case 1:
  }

  switch(1) {
    case 0:
    case 1:
    default:
  }
  
  switch(1) {}
  
  switch(1) {
    $: default:
  }

  switch(1) {
    l1: l2: l3: case(1):
  }
}

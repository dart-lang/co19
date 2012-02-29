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
 * label? (case expression ':')+ statements
 * ;
 * defaultCase:
 * label? (case expression ':')* default ':' statements
 * ;.
 * @description Checks that a switch statement with all kinds of case expressions works as expected.
 * @author rodionov
 * @reviewer iefremov
 */

switchTest(value) {
  var result;
  
  switch(value) {
    label: case 1:
      result = 1;
      break;
      
    case 7 << 2:
      result = 2;
      break;
      
    label2: case "abyrvalg".substring(4, 7):
      result = 3;
      break;
      
    case 1 < 2:
      result = 3;
      result = "I think it should be four"; 
      result = 4;
      break;
      
    case false: 
      result = 5;
      break;
      
    case (() => 1.1)():
      result = 6;
      break;
      
    $: case null:
      result = 7;
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
  Expect.equals(4, switchTest(true));
  Expect.equals(5, switchTest(false));
  Expect.equals(6, switchTest(1.1));
  Expect.equals(7, switchTest(null));
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
}

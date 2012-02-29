/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Execution of a switch statement switch (e) { case e1 : s1 ... case en : sn
 * default sn+1 } proceeds as follows:
 * The statement var n = e; is evaluated, where n is a variable whose name
 * is distinct from any other variable in the program. Next, the case clause case
 * e1 : s1 is executed if it exists. If case e1 : s1 does not exist, then the default
 * clause is executed by executing sn+1.
 * Execution of a case clause case ek : sk of a switch statement switch (e) 
 * { case e1 : s1 ... case en : sn default sn+1 } proceeds as follows:
 * The expression n == ek is evaluated to an object o which is then subjected
 * to boolean conversion yielding a value v. If v is false, or if sk is empty, 
 * the following case, case ek+1 : sk+1 is executed if it exists. 
 * If case ek+1 : sk+1 does not exist, then the default clause is executed
 * by executing sn+1. If v is true, then let m be the smallest non-negative integer
 * such that sk+m is non-blank; the statement sk+m is executed.
 * @description Checks that the cases are tested in the specified order, top to bottom
 * and if there're no statements in the matching case, then Dart continues looking for
 * statements to execute down from there. Some case expressions are equal to each other.
 * @author rodionov
 * @reviewer iefremov
 */

test(value) {
  var result;
  
  switch(value) {
    case 3: 
      return 1;
      break;
    case 1: 
      return 2;
      break;
    case 2: 
      return 3;
      break;
    case 1: 
      return 4;
      break;
    case 1: 
      return 5;
      break;
    case 2: 
      return 6;
      break;
    case 4:
    case 5:
    case 6:
      return 7;
      break;
    default: 
      return -1; 
      break;
  }  
  return result;
}

main() {
  Expect.equals(2, test(1));
  Expect.equals(3, test(2));
  Expect.equals(1, test(3));
  Expect.equals(7, test(4));
  Expect.equals(7, test(5));
  Expect.equals(7, test(6));
  Expect.equals(-1, test(7));
}

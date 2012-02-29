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
 * @description Checks that expressions in case clauses consequent to the matching
 * case are not executed.
 * @author iefremov
 */

String log = "";

f(value) {
  log += value.toString();
  return value;
}

main() {
  switch(1) {
    case f(1) :
    case f(2) :
    case f(null) :
  }
  Expect.equals("1", log, "To many expressions were executed in a switch!");
}
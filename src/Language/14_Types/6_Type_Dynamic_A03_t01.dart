/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Type Dynamic has methods for every possible identifier and arity. These methods all have
 * Dynamic as their return type, and their formal parameters all have type Dynamic.
 * @description Checks that invoking all sorts of methods on a Dynamic variable with all sorts of arguments 
 * and assigning the results to local variables of various types does not produce a static type warning.
 * @author iefremov
 * @reviewer rodionov
 */

 typedef func();
 typedef int func2(int);

main() {
  var x = null;
  try {
    String y = x.wakeUp(new Date(1, 1, 1, 1, 1, 1, 1));
    Expect.fail("NullPointerException expected");
  } on NullPointerException catch(ok) {}
  
  try {
    int i = x.writeConformanceTest(13.6, "Type_Dynamic_A03_t01");
    Expect.fail("NullPointerException expected");
  } on NullPointerException catch(ok) {}
  
  try {
    func f = x.eatPatty();
    Expect.fail("NullPointerException expected");
  } on NullPointerException catch(ok) {}
  
  try {
    func2 f2 = x.goSleep(new Duration(), true);
    Expect.fail("NullPointerException expected");
  } on NullPointerException catch(ok) {}
}


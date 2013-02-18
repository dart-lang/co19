/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Type dynamic has methods for every possible identifier and arity. These methods all have
 * dynamic as their return type, and their formal parameters all have type dynamic.
 * @description Checks that invoking all sorts of methods on a dynamic variable with all sorts of arguments 
 * and assigning the results to local variables of various types does not produce any static type warnings.
 * @author iefremov
 * @reviewer rodionov
 */
import "../../Utils/expect.dart";

typedef func();
typedef int func2(int);

main() {
  var x = null;
  try {
    String y = x.wakeUp(new Date(1, 1, 1, 1, 1, 1, 1));
    Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError catch(ok) {}
  
  try {
    int i = x.writeConformanceTest(13.6, "Type_Dynamic_A03_t01");
    Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError catch(ok) {}
  
  try {
    func f = x.eatPatty();
    Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError catch(ok) {}
  
  try {
    func2 f2 = x.goSleep(new Duration(), true);
    Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError catch(ok) {}
}

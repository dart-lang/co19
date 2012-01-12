/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Type Dynamic has properties for every possible identifier. These properties all have type Dynamic.
 * @description Checks that accessing properties with all sort of names on a Dynamic variable 
 * and assigning the results (in case of getters) to local variables of various types does not produce a static type error.
 * @author iefremov
 * @reviewer rodionov
 */

typedef func();
typedef int func2(int);

main() {
  var x = null;
  try {
    String y = x.thebullshour;
    Expect.fail("NullPointerException expected");
  } catch(NullPointerException ok) {}
  
  try {
    int i = x.thaisofathens;
    Expect.fail("NullPointerException expected");
  } catch(NullPointerException ok) {}
  
  try {
    func f = x.razorsedge;
    Expect.fail("NullPointerException expected");
  } catch(NullPointerException ok) {}
  
  try {
    func2 f2 = x.andromeda;
    Expect.fail("NullPointerException expected");
  } catch(NullPointerException ok) {}

  try {
    x.thebullshour = "asfasf";
    Expect.fail("NullPointerException expected");
  } catch(NullPointerException ok) {}
  
  try {
    x.thaisofathens = 1;
    Expect.fail("NullPointerException expected");
  } catch(NullPointerException ok) {}
  
  try {
    x.razorsedge = f() {};
    Expect.fail("NullPointerException expected");
  } catch(NullPointerException ok) {}
  
  try {
    x.andromeda = f(int a) => (a * a);
    Expect.fail("NullPointerException expected");
  } catch(NullPointerException ok) {}
}


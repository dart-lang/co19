/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Type Dynamic has properties for every possible identifier. These properties all have type Dynamic.
 * @description Checks that static type checker does not complain about unknown properties and these properties are assignable
 * to any typed variable (so they are Dynamic).
 * @author iefremov
 */

typedef func();
typedef int func2(int);

main() {
  var x = null;
  try {
    String y = x.thebullshour;
    Expect.fail("NullPointerException expected");
  } catch(NullPointerException ok){}
  try {
    int i = x.thaisofathens;
    Expect.fail("NullPointerException expected");
  } catch(NullPointerException ok){}
  try {
    func f = x.razorsedge;
    Expect.fail("NullPointerException expected");
  } catch(NullPointerException ok){}
  try {
    func2 f2 = x.andromeda;
    Expect.fail("NullPointerException expected");
  } catch(NullPointerException ok){}
}


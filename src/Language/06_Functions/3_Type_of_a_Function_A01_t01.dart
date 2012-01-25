/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If a function does not declare a return type explicitly,
 * its return type is Dynamic.
 * @description Checks that return type is Dynamic
 * static checker should not raise warnings because type Dynamic
 * has every method and property
 * @author msyabro
 * @reviewer kaigorodov
 */

f() {}
g() {return 1;}

main() {
  try {
    f().someMethod();
    Expect.fail("NullPointerException expected");
  } catch(NullPointerException e) {}
  
  try {
    f().x;
    Expect.fail("NullPointerException expected");
  } catch(NullPointerException e) {}

  try {
    g().someMethod();
    Expect.fail("NoSuchMethodException expected");
  } catch(NoSuchMethodException e) {}
  
  try {
    g().x;
    Expect.fail("NoSuchMethodException expected");
  } catch(NoSuchMethodException e) {}
}

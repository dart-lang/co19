/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If a function does not declare a return type explicitly,
 * its return type is dynamic.
 * @description Checks that return type is dynamic
 * static checker should not cause static warnings because type Dynamic
 * has every method and property
 * @author msyabro
 * @reviewer kaigorodov
 * @reviewer rodionov
 */

f() {}
g() {return 1;}

main() {
  try {
    f().someMethod();
    Expect.fail("NullPointerException expected");
  } on NullPointerException catch(e) {}
  
  try {
    f().x;
    Expect.fail("NullPointerException expected");
  } on NullPointerException catch(e) {}

  try {
    g().someMethod();
    Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError catch(e) {}
  
  try {
    g().x;
    Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError catch(e) {}
}

/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of i is the declared return type of T.m, if
 * T.m exists; otherwise the static type of i is dynamic.
 * @description Checks that the static type of a getter invocation expression
 * is dynamic if the getter does not exist. Checks by calling non-existed methods from
 * invocation result. If the static type is indeed dynamic there should not be any static warnings.
 * @author msyabro
 * @reviewer rodionov
 * @needsreview issue 3223
 */

class A {
}

main()  {
  var a = new A();

  try {
    a.v.someMethod();
    Expect.fail("NoSuchMethodError expected.");
  } on NoSuchMethodError catch(e) {}

  try {
    a.v.someVariable;
    Expect.fail("NoSuchMethodError expected.");
  } on NoSuchMethodError catch(e) {}

  try {
    a.v.anotherMethod();
    Expect.fail("NoSuchMethodError expected.");
  } on NoSuchMethodError catch(e) {}
}

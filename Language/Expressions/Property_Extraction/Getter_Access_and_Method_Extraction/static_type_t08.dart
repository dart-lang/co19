/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of i is:
 * • The declared return type of T.m, if T has an accessible instance getter
 *   named m.
 * • The declared return type of m, if T is Type, e is a constant type literal
 *   and the class corresponding to e declares an accessible static getter
 *   named m.
 * • The static type of function T.m if T has an accessible instance method
 *   named m.
 * • The static type of function m, if T is Type, e is a constant type literal
 *   and the class corresponding to e declares an accessible static method
 *   named m.
 * • The type dynamic otherwise.
 * @description Checks that the static type of a getter invocation expression
 * is dynamic if the getter does not exist. Checks by calling non-existed
 * methods from invocation result. If the static type is indeed dynamic there
 * should not be any static warnings.
 * @static-clean
 * @author msyabro
 * @reviewer rodionov
 * @needsreview issue 3223
 */
import '../../../../Utils/expect.dart';

class A {
}

main()  {
  var a = new A();

  try {
    a.v.someMethod();
    Expect.fail("NoSuchMethodError expected.");
  } on NoSuchMethodError catch (e) {}

  try {
    a.v.someVariable;
    Expect.fail("NoSuchMethodError expected.");
  } on NoSuchMethodError catch (e) {}

  try {
    a.v.anotherMethod();
    Expect.fail("NoSuchMethodError expected.");
  } on NoSuchMethodError catch (e) {}
}

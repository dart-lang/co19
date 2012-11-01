/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A cascaded method invocation has the form e..suffix where suffix is a sequence
 * of operator, method, getter or setter invocations.
 * cascadeSection:
 * '..'  (cascadeSelector arguments*)(assignableSelector arguments*)* (assignmentOperator expressionWithoutCascade)?
 * ;
 * cascadeSelector:
 *  '[ ' expression '] '
 *  | identifier
 * ;
 * @description Checks that using static members in a cascaded invocation expression results in a NoSuchMethodError
 * as expected, since they're being invoked on an instance.
 * @author rodionov
 * @reviewer kaigorodov
 */

class C {
  m1() {}
  m2() {}
  static sm() {}
  static var sv;
}

main() {
  var c = new C();
  try {
    c..sm();
    Expect.fail("NoSuchMethodError expected.");
  } on NoSuchMethodError catch(ok) {}

  try {
    c..sv;
    Expect.fail("NoSuchMethodError expected.");
  } on NoSuchMethodError catch(ok) {}

  try {
    c..m1()..sm()..m2();
    Expect.fail("NoSuchMethodError expected.");
  } on NoSuchMethodError catch(ok) {}
}

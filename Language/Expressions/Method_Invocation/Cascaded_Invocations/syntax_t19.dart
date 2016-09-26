/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A cascaded method invocation has the form e..suffix where e is
 * an expression and suffix is a sequence of operator, method, getter or
 * setter invocations.
 * cascadeSection:
 *   '..'  (cascadeSelector arguments*)(assignableSelector arguments*)*
 * (assignmentOperator expressionWithoutCascade)?
 * ;
 * cascadeSelector:
 *   '[' expression ']' |
 *   identifier
 * ;
 * @description Checks that using static members in a cascaded invocation
 * expression results in a NoSuchMethodError as expected, since they're being
 * invoked on an instance.
 * @author rodionov
 * @reviewer kaigorodov
 */
import '../../../../Utils/expect.dart';

class C {
  int i1 = 0;
  int i2 = 0;
  m1() {i1++;}
  m2() {i2++;}
  static sm() {}
  static var sv;
}

main() {
  dynamic c = new C();
  try {
    c..sm();
    Expect.fail("NoSuchMethodError expected.");
  } on NoSuchMethodError catch (ok) {}

  try {
    c..sv;
    Expect.fail("NoSuchMethodError expected.");
  } on NoSuchMethodError catch (ok) {}

  try {
    c..m1()..sm()..m2();
    Expect.fail("NoSuchMethodError expected.");
  } on NoSuchMethodError catch (ok) {}
  Expect.equals(1, c.i1, "m1 was not executed");
  Expect.equals(0, c.i2, "m2 was executed");
}

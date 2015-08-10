/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Invoking an abstract method, getter or setter results in an invocation of
 *  noSuchMethod exactly as if the declaration did not exist, unless a suitable member
 *  a is available in a superclass, in which case a is invoked.
 * @description Checks that invoking an abstract method, getter or setter
 * results in a NoSuchMethodError.
 * @static-warning
 * @author kaigorodov
 * @reviewer rodionov
 */
import "../../../Utils/expect.dart";

class C { /// static type warning Abstract Instance Members: It is a static warning if an abstract member is declared or inherited in a concrete class.
  void m();
  int get g;
  set g(int v);
}

main() {
  C c=new C();
  try {
    c.m();
    Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError catch (e) {}

  try {
  	var v = c.g; /// static type warning not assignable
  	Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError catch (e) {}

  try {
  	c.g = 1; /// static type warning cannot assign to 'METHOD'
  	Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError catch (e) {}
}

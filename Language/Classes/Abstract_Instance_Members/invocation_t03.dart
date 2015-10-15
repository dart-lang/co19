/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Invoking an abstract method, getter or setter results in an
 * invocation of noSuchMethod exactly as if the declaration did not exist,
 * unless a suitable member a is available in a superclass, in which case a is
 * invoked.
 * @description Checks that invoking an abstract method, getter or setter
 * results in invoking noSuchMethod method.
 * @static-warning
 * @author hlodvig
 */
import "../../../Utils/expect.dart";

class C {
  int m();    /// static type warnin
  int get g;    /// static type warnin
  set g(int v);   /// static type warnin
  int noSuchMethod(Invocation invocation) {
    return 666;
  }
}

main() {
  C c = new C();
  try {
    var v = c.m();
    Expect.equals(666, v);
  } on NoSuchMethodError catch (e) {
    Expect.fail("NoSuchMethodError is not expected");
  }

  try {
  	var v = c.g; /// static type warning not assignable
  	Expect.equals(666, v);
  } on NoSuchMethodError catch (e) {
    Expect.fail("NoSuchMethodError is not expected");
  }

  try {
  	c.g = 1; /// static type warning cannot assign to 'METHOD'
    Expect.equals(666, c.g);
  } on NoSuchMethodError catch (e) {
    Expect.fail("NoSuchMethodError is not expected");
  }
}

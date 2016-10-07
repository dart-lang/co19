/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A non-final variable declaration of the form var v;
 * or the form var v = e; always induces an implicit setter function 
 * with signature
 *   set v = (x)
 * whose execution sets the value of v to the incoming argument x.
 * @description Checks that the signature of this implicit setter is correct
 * and the type of its formal parameter is indeed dynamic by passing values of
 * various types to it.
 * @static-clean
 * @author pagolubev
 * @reviewer msyabro
 * @reviewer rodionov
 */
import "../../Utils/expect.dart";

class A {
  static var a;
  static var b = 1;
  static var c;
  static var d;
  static var e = "xxx";
  static var f = null;

}

main() {
  A.a = 1;
  Expect.equals(1, A.a);
  A.c = "foo";
  Expect.equals("foo", A.c);
  List foo = new List<Map<String, int>>();
  A.d = foo;
  Expect.equals(foo, A.d);

  A.b = -1;
  Expect.equals(-1, A.b);
  A.e = "bar";
  Expect.equals("bar", A.e);
  Map bar = new Map<String, int>();
  A.f = bar;
  Expect.equals(bar, A.f);
}

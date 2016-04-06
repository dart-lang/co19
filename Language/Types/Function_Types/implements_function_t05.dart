/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A function is always an instance of some class that implements the
 * class Function and implements a call method with the same signature as the
 * function. All function types are subtypes of Function.
 * @description Checks that various functions are also Objects, courtesy of the
 * transitive << relation that subtype relation is based on.
 * @author iefremov
 * @reviewer rodionov
 */
import "../../../Utils/expect.dart";
class C {
  if1() {}
  Object if2(var x, int z, [Object o, var v = 1]) {}
  Object if3(var x, int z, {o, v: 1}) {}

  static sf1() {}
  static Object sf2(var x, int z, [Object o, var v = 1]) {}
  static Object sf3(var x, int z, {o, v: 1}) {}
}

void tlf1() {}
Object tlf2(var x, int z, [Object o, var v = 1]) {}
Object tlf3(var x, int z, {o, v: 1}) {}

main() {
  void lf1() {}
  Object lf2(var x, int z, [Object o, var v = 1]) {}
  Object lf3(var x, int z, {o, v: 1}) {}

  Expect.isTrue(() {} is Object);
  Expect.isTrue((var x) {} is Object);
  Expect.isTrue(
      ((var x, int z, [Object o, var v = 1]) => x + z + o + v) is Object);

  Expect.isTrue(lf1 is Object);
  Expect.isTrue(lf2 is Object);
  Expect.isTrue(lf3 is Object);

  Expect.isTrue(tlf1 is Object);
  Expect.isTrue(tlf2 is Object);
  Expect.isTrue(tlf3 is Object);

  Expect.isTrue(new C().if1 is Object);
  Expect.isTrue(new C().if2 is Object);
  Expect.isTrue(new C().if3 is Object);

  Expect.isTrue(C.sf1 is Object);
  Expect.isTrue(C.sf2 is Object);
  Expect.isTrue(C.sf3 is Object);
}

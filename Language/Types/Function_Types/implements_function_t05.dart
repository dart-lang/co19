// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A function is always an instance of some class that implements the
/// class Function and implements a call method with the same signature as the
/// function. All function types are subtypes of Function.
/// @description Checks that various functions are also Objects, courtesy of the
/// transitive << relation that subtype relation is based on.
/// @author iefremov

import "../../../Utils/expect.dart";
class C {
  if1() {}
  Object if2(var x, int z, [Object? o, var v = 1]) => new Object();
  Object if3(var x, int z, {o, v: 1}) => new Object();

  static sf1() {}
  static Object sf2(var x, int z, [Object? o, var v = 1]) => new Object();
  static Object sf3(var x, int z, {o, v: 1}) => new Object();
}

void tlf1() {}
Object tlf2(var x, int z, [Object? o, var v = 1]) => new Object();
Object tlf3(var x, int z, {o, v: 1}) => new Object();

main() {
  void lf1() {}
  Object lf2(var x, int z, [Object? o, var v = 1]) => new Object();
  Object lf3(var x, int z, {o, v: 1}) => new Object();

  Expect.isTrue(() {} is Object);
  checkType(checkIs<Object>, true, () {});
  Expect.isTrue((var x) {} is Object);
  checkType(checkIs<Object>, true, (var x) {});
  Expect.isTrue(
      ((var x, int z, [Object? o, var v = 1]) => x + z + o + v) is Object);
  checkType(checkIs<Object>, true, ((var x, int z, [Object? o, var v = 1]) => x + z + o + v));

  Expect.isTrue(lf1 is Object);
  Expect.isTrue(lf2 is Object);
  Expect.isTrue(lf3 is Object);
  checkType(checkIs<Object>, true, lf1);
  checkType(checkIs<Object>, true, lf2);
  checkType(checkIs<Object>, true, lf3);

  Expect.isTrue(tlf1 is Object);
  Expect.isTrue(tlf2 is Object);
  Expect.isTrue(tlf3 is Object);
  checkType(checkIs<Object>, true, tlf1);
  checkType(checkIs<Object>, true, tlf2);
  checkType(checkIs<Object>, true, tlf3);

  Expect.isTrue(new C().if1 is Object);
  Expect.isTrue(new C().if2 is Object);
  Expect.isTrue(new C().if3 is Object);
  checkType(checkIs<Object>, true, C().if1);
  checkType(checkIs<Object>, true, C().if2);
  checkType(checkIs<Object>, true, C().if3);

  Expect.isTrue(C.sf1 is Object);
  Expect.isTrue(C.sf2 is Object);
  Expect.isTrue(C.sf3 is Object);
  checkType(checkIs<Object>, true, C.sf1);
  checkType(checkIs<Object>, true, C.sf2);
  checkType(checkIs<Object>, true, C.sf3);
}

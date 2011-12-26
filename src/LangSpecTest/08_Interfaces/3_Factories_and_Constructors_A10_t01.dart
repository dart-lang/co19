/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If the default factory clause of I includes a list of type parameters tps, then
 * tps must be identical to the type parameters given in the declaration of F, or a
 * compile-time error occurs
 * @description Checks that there is no compile-time error when this requirement is met
 * for generic factory class implementing the interface.
 * @author vasya
 * @reviewer rodionov
 * @reviewer kaigorodov
 */

class F1<T1, T2> implements I1 {
  F1() {}
  F1.foo() {}
}

interface I1<T1, T2> default F1<T1, T2> {
  I1();
  I1.foo();
}

class F2<T1, T2> implements I2 {
  F2(T1 t1, T2 t2) {}
  F2.foo(T1 t1);
}

interface I2<T1, T2> default F2<T1, T2> {
  I2(T1 t1, T2 t2);
  I2.foo(T1 t1);
}


main() {
  new I1();
  new I1.foo();
  new I2(null, null);
  new I2.foo(null);
}


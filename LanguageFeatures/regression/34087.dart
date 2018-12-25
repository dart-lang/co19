/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Regression test for the issue 34087 (Dartanalyzer does not throw
 * error when [Callable] function result is assigned to incorrect type).
 * Checks that compile error appears if [Callable] function result is assigned
 * to the variable of incorrect type.
 * @Issue 34087
 * @author iarkh@unipro.ru
 */
class A<X> {}

class F {
  X call<X extends A<X>>() { return null; }
}

main() {
  F testme = new F();             //# 01: compile-time error
  A<A> a1 = testme();             //# 02: compile-time error
  A<A<A>> a2 = testme();          //# 03: compile-time error
  A<A<A<A>>> a3 = testme();       //# 04: compile-time error
  A<A<A<A<A>>>> a4 = testme();    //# 05: compile-time error
  A<A<A<A<A<A>>>>> a5 = testme(); //# 06: compile-time error
}


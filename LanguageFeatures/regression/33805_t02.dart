/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Regression test for the issue 33805 (Analyzer throws error when
 * try to assign a function result to row variable). Checks that error appears
 * if row variable is passed to the function parameter
 * @author iarkh@unipro.ru
 */
class A<X> {}
testme<X extends A<X>>(X) {}

A a;
A<A> a1;
A<A<A>> a2;

main() {
  testme(a);  //# 01: compile-time error
  testme(a1); //# 02: compile-time error
  testme(a2); //# 03: compile-time error
}


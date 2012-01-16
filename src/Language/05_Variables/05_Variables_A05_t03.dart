/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A variable that is both static and final must be initialized to 
 * a compile-time constant (10.1) or a compile-time error occurs. 
 * @description Checks that static final variables can be initialized to
 * a compile-time constant (10.1).
 * @author vasya
 * @reviewer kaigorodov
 * @reviewer msyabro
 */

class Foo {
  const Foo();
}

class C {
  static final int i = -100;
  static final bool b = false;
  static final String s = "string";
  static final double pi = Math.PI;
  static final Foo foo = const Foo();
  static final List l = const [0,1,2,3];
  static final Map m = const {'a': 1, 'b': 2};
  static final bool bOr = true || false;
  static final int iPlus = 5 + i;
}

main() {
  Expect.isTrue(-100 === C.i);
  Expect.isTrue(false === C.b);
  Expect.isTrue("string" === C.s);
  Expect.isTrue(Math.PI === C.pi);
  Expect.isTrue(const Foo() === C.foo);
  Expect.isTrue(const [0,1,2,3] === C.l);
  Expect.isTrue(const {'a': 1, 'b': 2} === C.m);
  Expect.isTrue(true || false === C.bOr);
  Expect.isTrue(-95 === C.iPlus);
}


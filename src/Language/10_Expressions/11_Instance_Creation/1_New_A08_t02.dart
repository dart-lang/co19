/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If T is a parameterized type S < U1, ... ,Um >, let R = S. It is a
 * compile-time error if S is not a generic type with m type parameters. If T is
 * not a parameterized type, let R = T. If R is an interface, let C be the factory
 * class of R. Otherwise let C = R. Furthermore, if e is of the form new
 * T.id(a1, ... , an, xn+1 : an+1, ... , xn+k : an+k) then let q be the constructor of C
 * that corresponds to the constructor T.id, otherwise let q be the constructor
 * of C that corresponds to the constructor T. Finally, if C is generic but T is
 * not a parameterized type, then for i from 1 to m, let Vi = Dynamic, otherwise let
 * Vi = Ui.
 * Evaluation of e proceeds as follows:
 * First, if q is a generative constructor (regardless of whether q is redirecting or not), then:
 * A fresh instance, i, of class C is allocated.
 * @description Checks that a fresh instance is allocated with every constructor invocation
 * even if the class has only constant constructors, one of which is being invoked by the new
 * expression.
 * @author msyabro
 * @reviewer rodionov
 */

class A {
  const A();
}

main() {
  var a = [];
  for(int i = 0; i < 10; i++) {
    a.addLast(new A());
    for(int j = 0; j < i; j++) {
      Expect.isFalse(a[j] === a[i]);
    }
  }
}

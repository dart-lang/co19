/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A type T is more specific than a type S, written T << S, if S is a direct supertype of T.
 * << is a partial order on types. T is a subtype of S, written T <: S, iff [⊥/Dynamic]T << S.
 * A type T may be assigned to a type S, written T <=> S, if either T <: S or S <: T.
 * @description Checks that this statement is true for various non-generic interface types.
 * @author iefremov
 * @reviewer rodionov
 */


abstract class I {}

class A implements I {
  A() {}
}

class B extends A {
  B() {}
}

class C {
  C() {}
}

class Checker<S> {
  Checker() {}
  
  check(var t) {
    Expect.isTrue(t is S);
    S ss = t;
  }
}

main() {
  new Checker<num>().check(1);
  new Checker<num>().check(1.0);
  new Checker<A>().check(new B());
  new Checker<Object>().check(new C());
  new Checker<I>().check(new A());
}

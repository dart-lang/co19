/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A type T is more specific than a type S, written T << S, if T is of the form I<T1, ..., Tn> and
 * S is of the form I<S1, ..., Sn> and: Ti << Si , 1 <= i <= n
 * << is a partial order on types. T is a subtype of S, written T <: S, iff [⊥/Dynamic]T << S.
 * A type T may be assigned to a type S, written T <=> S, if either T <: S or S <: T .
 * @description Trivial checks that GenericType<T> is a subtype of GenericType<S> where T is a type parameter and
 * S is a type parameter bound. Checks their mutual assignability (no static type warnings) as well.
 * @author iefremov
 * @reviewer rodionov
 */

abstract class I {}
abstract class J extends I {}
abstract class K extends J {}
class C implements K {}

class Checker_I<T extends I> implements I {
  Checker_I() {}
  
  check() {
    Expect.isTrue(new Checker_I<T>() is Checker_I<I>);
    Checker_I<I> c1 = new Checker_I<T>();
    Checker_I<T> c2 = Checker_I<I> f (){} ();
  }
}

class Checker_Object<T> {
  Checker_Object() {}
  
  check() {
    Expect.isTrue(new Checker_Object<T>() is Checker_Object<Object>);
    Checker_Object<Object> c1 = new Checker_Object<T>();
    Checker_Object<T> c2 = Checker_Object<Object> f() {} ();
  }
}

main() {
  new Checker_I().check();
  new Checker_I<Checker_I>().check();
  new Checker_I<I>().check();
  new Checker_I<J>().check();
  new Checker_I<K>().check();
  new Checker_I<C>().check();

  new Checker_Object().check();
  new Checker_Object<Checker_Object>().check();
  new Checker_Object<Checker_I>().check();
  new Checker_Object<I>().check();
  new Checker_Object<J>().check();
  new Checker_Object<K>().check();
  new Checker_Object<C>().check();
}


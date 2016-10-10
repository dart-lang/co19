/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A type T is more specific than a type S, written T << S, if one
 * of the following conditions is met:
 *  • T is S.
 *  • T is ⊥
 *  • S is dynamic.
 *  • S is a direct supertype of T.
 *  • T is a type parameter and S is the upper bound of T.
 *  • T is a type parameter and S is Object.
 *  • T is of the form I<T1, ..., Tn > and S is of the form I <S1, ..., Sn>
 *    and Ti << Si 1 <= i <= n.
 *  • T and S are both function types, and T << S under the rules of section
 *    (Types/Function Types).
 *  • T is a function type and S is Function.
 *  • T << U and U << S.
 * << is a partial order on types. T is a subtype of S, written T <: S, iff
 * [⊥/Dynamic]T << S.
 * . . .
 * An interface type T may be assigned to a type S, written T <=> S, if either
 * T <: S or S <: T.
 * @description Trivial checks that GenericType<T> is a subtype of
 * GenericType<S> where T is a type parameter and S is a type parameter bound.
 * Checks their mutual assignability (no static type warnings) as well.
 * @static-clean
 * @author iefremov
 * @reviewer rodionov
 */
import "../../../Utils/expect.dart";

class I {}
class J extends I {}
class K extends J {}
class C implements K {}

class Checker_I<T extends I> implements I {
  Checker_I() {}

  check() {
    Expect.isTrue(new Checker_I<T>() is Checker_I<I>);
    Checker_I<I> c1 = new Checker_I<T>();
  }
}

class Checker_Object<T> {
  Checker_Object() {}

  Checker_Object<Object> f2() {}

  check() {
    Expect.isTrue(new Checker_Object<T>() is Checker_Object<Object>);
    Checker_Object<Object> c1 = new Checker_Object<T>();
    Checker_Object<T> c2 = f2();
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

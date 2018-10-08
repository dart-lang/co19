/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Instantiate to bound then computes an actual type argument list
 * for [G] as follows:
 *
 *   Let [Ui],[1] be [Si], for all [i] in [1 .. k]. (This is the "current value"
 *   of the bound for type variable [i], at step [1]; in general we will
 *   consider the current step, [m], and use data for that step, e.g., the bound
 *   [Ui],[m], to compute the data for step [m + 1]).
 *
 *   Let [-->m] be a relation among the type variables [X1 .. Xk] such that
 *   [Xp -->m Xq] iff [Xq] occurs in [Up],[m] (so each type variable is related
 *   to, that is, depends on, every type variable in its bound, possibly
 *   including itself). Let [==>m] be the transitive closure of [-->m]. For each
 *   [m], let [Ui],[m+1], for [i] in [1 .. k], be determined by the following
 *   iterative process:
 *
 *   1. If there exists a [j] in [1 .. k] such that [Xj ==>m X0j] (that is, if
 *   the dependency graph has a cycle) let [M1 .. Mp] be the strongly connected
 *   components (SCCs) with respect to [-->m] (that is, the maximal subsets of
 *   [X1 .. Xk] where every pair of variables in each subset are related in both
 *   directions by [==>m]; note that the SCCs are pairwise disjoint; also, they
 *   are uniquely defined up to reordering, and the order does not matter). Let
 *   [M] be the union of [M1 .. Mp] (that is, all variables that participate in
 *   a dependency cycle). Let [i] be in [1 .. k]. If [Xi] does not belong to [M]
 *   then [Ui,m+1 = Ui,m]. Otherwise there exists a [q] such that [Xi] belongs
 *   to [Mq]; [Ui,m+1] is then obtained from [Ui,m] by replacing every covariant
 *   occurrence of a variable in [Mq] by [dynamic], and replacing every
 *   contravariant occurrence of a variable in [Mq] by [Null].
 *
 *   2. Otherwise, (if no dependency cycle exists) let [j] be the lowest number
 *   such that [Xj] occurs in [Up,m] for some [p] and [Xj -/->m Xq] for all [q]
 *   in [1..k] (that is, [Uj,m] is closed, that is, the current bound of [Xj]
 *   does not contain any type variables; but [Xj] is being depended on by the
 *   bound of some other type variable). Then, for all [i] in [1 .. k], [Ui,m+1]
 *   is obtained from [Ui,m] by replacing every covariant occurrence of [Xj] by
 *   [Uj,m], and replacing every contravariant occurrence of [Xj] by [Null].
 *
 *   3. Otherwise, (when no dependencies exist) terminate with the result
 *   [<U1,m ..., Uk,m>].
 * @description Checks that class parameter can be of any type.
 * @author iarkh@unipro.ru
 */
class A<X> implements B<X> {}
class B<X> {}

main() {
  A a1 = new A();

  A a2 = new A<B>();
  A a3 = new A<Null>();
  A a4 = new A<dynamic>();
  A a5 = new A<void>();
  A a6 = new A<Object>();
  A a7 = new A<List>();

  A<B> a8 = new A();
  A<Null> a9 = new A();
  A<dynamic> a10 = new A();
  A<void> a11 = new A();
  A<Object> a12 = new A();
  A<List> a13 = new A();
}

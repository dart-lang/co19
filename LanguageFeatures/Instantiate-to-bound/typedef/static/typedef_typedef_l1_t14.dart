// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion Instantiate to bound then computes an actual type argument list
/// for [G] as follows:
///
///   Let [Ui],[1] be [Si], for all [i] in [1 .. k]. (This is the "current value"
///   of the bound for type variable [i], at step [1]; in general we will
///   consider the current step, [m], and use data for that step, e.g., the bound
///   [Ui],[m], to compute the data for step [m + 1]).
///
///   Let [-->m] be a relation among the type variables [X1 .. Xk] such that
///   [Xp -->m Xq] iff [Xq] occurs in [Up],[m] (so each type variable is related
///   to, that is, depends on, every type variable in its bound, possibly
///   including itself). Let [==>m] be the transitive closure of [-->m]. For each
///   [m], let [Ui],[m+1], for [i] in [1 .. k], be determined by the following
///   iterative process:
///
///   1. If there exists a [j] in [1 .. k] such that [Xj ==>m X0j] (that is, if
///   the dependency graph has a cycle) let [M1 .. Mp] be the strongly connected
///   components (SCCs) with respect to [-->m] (that is, the maximal subsets of
///   [X1 .. Xk] where every pair of variables in each subset are related in both
///   directions by [==>m]; note that the SCCs are pairwise disjoint; also, they
///   are uniquely defined up to reordering, and the order does not matter). Let
///   [M] be the union of [M1 .. Mp] (that is, all variables that participate in
///   a dependency cycle). Let [i] be in [1 .. k]. If [Xi] does not belong to [M]
///   then [Ui,m+1 = Ui,m]. Otherwise there exists a [q] such that [Xi] belongs
///   to [Mq]; [Ui,m+1] is then obtained from [Ui,m] by replacing every covariant
///   occurrence of a variable in [Mq] by [dynamic], and replacing every
///   contravariant occurrence of a variable in [Mq] by [Null].
///
///   2. Otherwise, (if no dependency cycle exists) let [j] be the lowest number
///   such that [Xj] occurs in [Up,m] for some [p] and [Xj -/->m Xq] for all [q]
///   in [1..k] (that is, [Uj,m] is closed, that is, the current bound of [Xj]
///   does not contain any type variables; but [Xj] is being depended on by the
///   bound of some other type variable). Then, for all [i] in [1 .. k], [Ui,m+1]
///   is obtained from [Ui,m] by replacing every covariant occurrence of [Xj] by
///   [Uj,m], and replacing every contravariant occurrence of [Xj] by [Null].
///
///   3. Otherwise, (when no dependencies exist) terminate with the result
///   [<U1,m ..., Uk,m>].
///
/// @description Checks that instantiate-to-bounds works correctly for
/// typedef A<X> = void Function(X);
/// typedef G<X extends A<X>> = void Function()
///
/// To compute i2b on `G`, we have
///    X, no variance
///    -----------------------
///    A<X>                    Break cycle {X}
///    A<dynamic>
///
/// The reason why we use [dynamic] rather than [Never] to break the cycle is
/// that it occurs in a position which isn't contravariant (in [G<A<X>>], [A<X>]
/// occurs in a position that has no variance, and hence [X] occurs in a position
/// that has no variance).
///
/// So [G] means [G<A<dynamic>>], which is a well-bounded type (`A<dynamic> ==
///   void Function(dynamic) <: void Function(void Function(dynamic)) ==
///   A<A<dynamic>>`).
///
/// However, [G<T>] is simply [void Function()] for all [T], so in the
/// initializations of [targetN], [N] in [1..8], the initializing expression has
/// the type [void Function()].
///
/// So we just need to consider whether the declared types are OK, because each
/// of them just means [void Function()], unless it's an error.
///
/// The tools are right: each of [G<A<A<dynamic>>>], [G<A<A<A<dynamic>>>],
/// [G<A<A<A<A<dynamic>>>>>] is either regular-bounded (with an odd number of
/// [A]s) or super-bounded (with an even number of [A]s), and the ones with
/// [Never] are regular-bounded for an even number of [A]s and an error for an
/// odd number of [A]s.
///
/// @Issue 41963, 41964
/// @author iarkh@unipro.ru

typedef A<X> = void Function(X);
typedef G<X extends A<X>> = void Function();

test(G g) {}

main() {
  G source;
}

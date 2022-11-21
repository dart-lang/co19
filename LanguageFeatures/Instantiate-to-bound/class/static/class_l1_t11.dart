// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

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
/// @description Checks that trying to declare [class A<X extends A<X>>],
/// [class B<X extends A<X>?>] causes error:
///
/// In order to allow the use of `A<X>` in the bound in `B`, we must show that
/// `X` satisfies the bound on the type parameter of `A`, i.e., we must show
/// `X <: A<X>`. But the constraint on `X` in `B` is actually `X <: A<X>?`, and
/// that is satisfied by `X == Null`, and it is not true that `Null <: A<Null>`,
/// which is a counterexample to the claim that we can show `X <: A<X>`.
///
/// The point is that we need to show that `X <: A<X>?` implies `X <: A<X>`, and
/// we know we can never prove that because we have a counterexample.
///
/// There is no such problem in `C`: In that case we need to show that
/// `X <: C<X>?` implies `X <: C<X>?`, which is immediate.
///
/// The underlying requirement is that the type in the bound (like `A<X>` and
/// `C<X>`) must be well-bounded, just like any other type, based on whatever we
/// know about the involved types. In this situation the declared bounds of type
/// parameters is the only thing we know about those type parameters, so we need
/// to show that the declared bounds suffice to show that the type is
/// well-bounded. For instance, in `C` we need to show that the bound in `C`
/// suffices to show the bound in `C`; but in `B` we need to show that the bound
/// in `B` suffices to show the bound in `A` (and it doesn't, so `B` is an
/// error).
///
/// @author iarkh@unipro.ru


class A<X extends A<X>> {}

class B<X extends A<X>?> {}
//      ^
// [analyzer] unspecified
// [cfe] unspecified

class C<X extends C<X>?> {}

main() {
}

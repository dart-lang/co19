// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The closure of a type constraint `Pb <: X <: Pt` with respect to
/// a set of type variables `L` is the subtype constraint `Qb <: X <: Qt` where
/// `Qb` is the greatest closure of `Pb` with respect to `L`, and `Qt` is the
/// least closure of `Pt` with respect to `L`.
///
/// Note that the closure of a type constraint implies the original constraint:
/// that is, any solution to the original constraint that is closed with respect
/// to `L`, is a solution to the new constraint.
///
/// The motivation for these operations is that constraint generation may
/// produce a constraint on a type variable from an outer scope (say `S`) that
/// refers to a type variable from an inner scope (say `T`). For example,
/// `<T>(T) -> List<T> <: <T>(T) -> S` constrains `List<T>` to be a subtype of
/// `S`. But this constraint is ill-formed outside of the scope of `T`, and
/// hence if inference requires this constraint to be generated and moved out of
/// the scope of `T`, we must approximate the constraint to the nearest
/// constraint which does not mention `T`, but which still implies the original
/// constraint. Choosing the greatest closure of `List<T>` (i.e. `List<Object?>`)
/// as the new supertype constraint on `S` results in the constraint
/// `List<Object?> <: S`, which implies the original constraint.
///
/// @description Check that the closure of a type constraint `Pb <: X <: Pt`
/// with respect to a set of type variables `L` is the subtype constraint
/// `Qb <: X <: Qt` where `Qt` is the least closure of `Pt` with respect to `L`.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

class C<T> {
  C(List<X> Function<X>(T x));
}

List<Y> foo<Y>(Y y) => [y];

void main() {
  var x = C(foo);
  x.expectStaticType<Exactly<C<Never>>>();
}

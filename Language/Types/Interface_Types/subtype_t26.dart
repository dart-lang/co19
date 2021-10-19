// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion A type T is more specific than a type S, written T << S, if one
/// of the following conditions is met:
///  • T is S.
///  • T is ⊥
///  • S is dynamic.
///  • S is a direct supertype of T.
///  • T is a type parameter and S is the upper bound of T.
///  • T is a type parameter and S is Object.
///  • T is of the form I<T1, ..., Tn > and S is of the form I <S1, ..., Sn>
///    and Ti << Si 1 <= i <= n.
///  • T and S are both function types, and T << S under the rules of section
///    (Types/Function Types).
///  • T is a function type and S is Function.
///  • T << U and U << S.
/// << is a partial order on types. T is a subtype of S, written T <: S, iff
/// [⊥/Dynamic]T << S.
/// . . .
/// An interface type T may be assigned to a type S, written T <=> S, if either
/// T <: S or S <: T.
/// @description Checks that GenericType<T> is mutually assignable (no static
/// type warnings) with GenericType<S> where T and S are trivial generics.
/// @issue 27556
/// @author iefremov


class I {}
class J extends I {}
class K extends J {}
class L extends K {}

typedef J f(List<int> l, [L i]);
typedef J f_1(List<num> l, [I i]);
typedef K f_2(List<int> l, [K i]);

main() {
  List l1_ = new List<List>.empty();

  List<List> l2 = new List<List<List>>.empty();

  List<List> l3 = new List<List<List<List>>>.empty();

  List<List<List>> l4_ = new List<List<List<List>>>.empty();

  List<List<List<List>>> l5 = new List.empty();
  List l5_ = new List<List<List<List>>>.empty();

  List<Map> l6_ = new List<Map<int, double>>.empty();

  List<Map<num, num>> l7_ = new List<Map<int, double>>.empty();

  List<f> l8 = new List<f>.empty();

  List<f> l9_ = new List<f_1>.empty();

  List<f> l10_ = new List<f_2>.empty();
}

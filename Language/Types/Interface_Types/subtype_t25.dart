// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

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
/// @description Checks that GenericType<T> is mutually assignable with
/// GenericType<S> (no static type warnings) where T is a subtype of S (T and
/// S are non-generic interfaces and/or Dynamic).
/// @author iefremov


class I {}
class J extends I {}
class K extends J {}

class Z<T> {
  Z() {}
}

main() {
  List<String> l1 = new List.empty();
  List l2 = new List<String>.empty();

  List<Object> l3_ = new List<String>.empty();

  List<num> l4_ = new List<int>.empty();

  List<Object> l5_ = new List<int>.empty();

  List<Object> l6_ = new List<double>.empty();

  List<num> l7_ = new List<double>.empty();

  List<Object> l8_ = new List<J>.empty();

  List<I> l9_ = new List<I>.empty();

  List<I> l10_ = new List<K>.empty();

  List<J> l11_ = new List<K>.empty();

  List<int> l12 = new List.empty();

  List<double> l13 = new List.empty();

  List<J> l14 = new List.empty();

  List<String> z1 = new List<String>.empty();
  List z2 = new List<String>.empty();

  Z<Object> z3_ = new Z<String>();

  Z<num> z4_ = new Z<int>();

  Z<Object> z5_ = new Z<int>();

  Z<Object> z6_ = new Z<double>();

  Z<num> z7_ = new Z<double>();

  Z<Object> z8_ = new Z<J>();

  Z<I> z9_ = new Z<J>();

  Z<I> z10_ = new Z<K>();

  Z<J> z11_ = new Z<K>();

  Z<int> z12 = new Z();

  Z<double> z13 = new Z();

  Z<J> z14 = new Z();
}

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
 * @description Checks that GenericType<T> is mutually assignable with
 * GenericType<S> (no static type warnings) where T is a subtype of S (T and
 * S are non-generic interfaces and/or Dynamic).
 * @static-clean
 * @author iefremov
 * @reviewer rodionov
 */

class I {}
class J extends I {}
class K extends J {}

class Z<T> {
  Z() {}
}

main() {
  List<String> l1 = new List();
  List l2 = new List<String>();

  List<Object> l3_super;
  List<String> l3 = l3_super;
  List<Object> l3_ = new List<String>();

  List<num> l4_super;
  List<int> l4 = l4_super;
  List<num> l4_ = new List<int>();

  List<Object> l5_super;
  List<int> l5 = l5_super;
  List<Object> l5_ = new List<int>();

  List<Object> l6_super;
  List<double> l6 = l6_super;
  List<Object> l6_ = new List<double>();

  List<num> l7_super;
  List<double> l7 = l7_super;
  List<num> l7_ = new List<double>();

  List<Object> l8_super;
  List<J> l8 = l8_super;
  List<Object> l8_ = new List<J>();

  List<I> l9_super;
  List<J> l9 = l9_super;
  List<I> l9_ = new List<I>();

  List<I> l10_super;
  List<K> l10 = l10_super;
  List<I> l10_ = new List<K>();

  List<J> l11_super;
  List<K> l11 = l11_super;
  List<J> l11_ = new List<K>();

  List<int> l12 = new List();

  List<double> l13 = new List();

  List<J> l14 = new List();

  List<String> z1 = new List();
  List z2 = new List<String>();

  Z<Object> z3_super;
  Z<String> z3 = z3_super;
  Z<Object> z3_ = new Z<String>();

  Z<num> z4_super;
  Z<int> z4 = z4_super;
  Z<num> z4_ = new Z<int>();

  Z<Object> z5_super;
  Z<int> z5 = z5_super;
  Z<Object> z5_ = new Z<int>();

  Z<Object> z6_super;
  Z<double> z6 = z6_super;
  Z<Object> z6_ = new Z<double>();

  Z<num> z7_super;
  Z<double> z7 = z7_super;
  Z<num> z7_ = new Z<double>();

  Z<Object> z8_super;
  Z<J> z8 = z8_super;
  Z<Object> z8_ = new Z<J>();

  Z<I> z9_super;
  Z<J> z9 = z9_super;
  Z<I> z9_ = new Z<J>();

  Z<I> z10_super;
  Z<K> z10 = z10_super;
  Z<I> z10_ = new Z<K>();

  Z<J> z11_super;
  Z<K> z11 = z11_super;
  Z<J> z11_ = new Z<K>();

  Z<int> z12 = new Z();

  Z<double> z13 = new Z();

  Z<J> z14 = new Z();
}

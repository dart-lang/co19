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
 * @description Checks that GenericType<T> is a subtype of GenericType<S> where
 * T and S are trivial generics.
 * @author iefremov
 * @reviewer rodionov
 */
import "../../../Utils/expect.dart";

class I {}
class J extends I {}
class K extends J {}
class L extends K {}

// subtypes of each other, according to (Types/Function Types)
typedef J f(List<num> l, [J i]);
typedef I f_1(List<int> l, [I i]);
typedef K f_2(List<int> l, [L i]);

main() {
  Expect.isTrue(new List<List>() is List);
  Expect.isTrue(new List<List>() is List<List<List>>);
  Expect.isTrue(new List<List>() is List<List<List<List>>>);
  Expect.isTrue(new List<List<List<List>>>() is List<List<List>>);
  Expect.isTrue(new List<List<List<List>>>() is List);

  Expect.isTrue(new List<Map<int, double>>() is List<Map>);
  Expect.isTrue(new List<Map<int, double>>() is List<Map<num, num>>);

  Expect.isTrue(new List<f>() is List<f>);
  Expect.isTrue(new List<f_1>() is List<f>);
  Expect.isTrue(new List<f_2>() is List<f>);
}

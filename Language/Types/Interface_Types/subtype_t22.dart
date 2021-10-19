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
/// @description Checks that GenericType1<T> is a subtype of GenericType2<S>
/// where T and S are complex generics. Checks mutual assignability as well.
/// @issue 27556
/// @author iefremov

import "../../../Utils/expect.dart";

class I<A, B, C> {}
class J<A, B, C> extends I<A, B, C> {}
class K extends J {}
class C extends K {}

typedef J f(I<K, List<Map<int, double>>, int> i, [List<Map> j]);
typedef K f_1(I<J, List<Map<int, num>>, num> i, [List<Map> j]);
typedef C f_2(I<J, List<Map<int, num>>, num> i, [List<Map> j]);

main() {
  Expect.isTrue(new I<f_1, int, List<Map<int, Map<int, int>>>>() is I<f, num, List<Map<num, Map>>>);
  Expect.isTrue(new I<f_2, int, List<Map<int, Map<int, int>>>>() is I<f, num, List<Map<num, Map>>>); // fails
  Expect.isTrue(new J<f_1, int, List<Map<int, Map<int, int>>>>() is I<f, num, List<Map<num, Map>>>);
  Expect.isTrue(new J<f_2, int, List<Map<int, Map<int, int>>>>() is I<f, num, List<Map<num, Map>>>); // fails
  Expect.isFalse(new K() is I<f, num, List<Map<num, Map>>>);
  Expect.isFalse(new C() is I<f, num, List<Map<num, Map>>>);

  I<f, num, List<Map<num, Map>>> v1_ = new I<f_1, int, List<Map<int, Map<int, int>>>>();

  I<f, num, List<Map<num, Map>>> v2_ = new I<f_2, int, List<Map<int, Map<int, int>>>>();

  I<f, num, List<Map<num, Map>>> v3_ = new J<f_1, int, List<Map<int, Map<int, int>>>>();

  I<f, num, List<Map<num, Map>>> v4_ = new J<f_2, int, List<Map<int, Map<int, int>>>>();
}

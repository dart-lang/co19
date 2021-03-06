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
/// @description Checks that null (the only value of type ⊥) may be assigned to
/// any nullable variable.
/// @author iefremov


class A {}

abstract class I {}

typedef t1();
typedef void t2();
typedef List t3(List<int>? l, [Map<List, List<Map>>? m]);

main() {
  var x = null;
  int? i = null;
  Object? o = null;
  String? s = null;
  bool? b = null;
  List? l = null;
  List<int>? l1 = null;
  List<List>? l2 = null;
  List<Map<List, List>>? l3 = null;
  double? d = null;
  A? a = null;
  I? j = null;
  Function? f = null;
  t1? v1 = null;
  t2? v2 = null;
  t3? v3 = null;
}

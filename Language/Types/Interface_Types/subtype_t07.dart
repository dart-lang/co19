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
/// @description Checks that any type (interface type, function type, generic)
/// is (more specific than) dynamic.
/// @author iefremov

import "../../../Utils/expect.dart";

List<Map<List, Map>> f1(num n, Object o, [var x, List? y]) => [];

main() {
  Expect.isTrue(new Object() is dynamic);
  checkType(checkIs<dynamic>, true, new Object());
  Expect.isTrue(1 is dynamic);
  checkType(checkIs<dynamic>, true, 1);
  Expect.isTrue(0.1 is dynamic);
  checkType(checkIs<dynamic>, true, 0.1);
  Expect.isTrue("" is dynamic);
  checkType(checkIs<dynamic>, true, "");
  Expect.isTrue(true is dynamic);
  checkType(checkIs<dynamic>, true, true);
  Expect.isTrue(false is dynamic);
  checkType(checkIs<dynamic>, true, false);
  Expect.isTrue(new List.empty() is dynamic);
  checkType(checkIs<dynamic>, true, new List.empty());
  Expect.isTrue(new List<Map<List, List<int>>>.empty() is dynamic);
  checkType(checkIs<dynamic>, true, new List<Map<List, List<int>>>.empty());
  Expect.isTrue(() {} is dynamic);
  checkType(checkIs<dynamic>, true, () {});
  Expect.isTrue((num n, Object o, [var x, List? y]) {} is dynamic);
  checkType(checkIs<dynamic>, true, (num n, Object o, [var x, List? y]) {});
  Expect.isTrue(f1 is dynamic);
  checkType(checkIs<dynamic>, true,f1);
}

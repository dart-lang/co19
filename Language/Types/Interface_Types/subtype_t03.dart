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
/// @description Checks that a generic type T with several type parameters is a
/// subtype of itself and T is assignable to itself.
/// @author iefremov

import "../../../Utils/expect.dart";

class A<T, S, U> {
}

main() {
  //trivial check
  A a = new A();
  Expect.isTrue(a is A);
  checkType(checkIs<A>, true, a);
  A b = a;
  a = new A();
  Expect.isFalse(identical(a, b));

  //check with type parameters
  A<int, double, A> n = new A<int, double, A>();
  Expect.isTrue(n is A<int, double, A>);
  checkType(checkIs<A<int, double, A>>, true, n);
  Expect.isTrue(a is A);
  checkType(checkIs<A>, true, a);

  a = n;
  n = new A();

  //type parameters are also generic
  a = new A();
  A<A<A, int, double>, List<String>, A> n2 = new A<A<A, int, double>, List<String>, A>();
  Expect.isTrue(n2 is A<A<A, int, double>, List<String>, A>);
  checkType(checkIs<A<A<A, int, double>, List<String>, A>>, true, n2);
  Expect.isTrue(a is A);
  checkType(checkIs<A>, true, a);

  a = n2;
  n2 = new A();

  Map m = new Map();
  Expect.isTrue(m is Map);
  checkType(checkIs<Map>, true, m);
  Map m2 = m;
  m = new Map();

  Map<int, Object> mio = new Map<int, Object>();
  Expect.isTrue(mio is Map<int, Object>);
  checkType(checkIs<Map<int, Object>>, true, mio);
  Map<int, Object> mio2 = mio;
  mio = new Map<int, Object>();
}

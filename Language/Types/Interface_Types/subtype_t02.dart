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
/// @description Checks that a generic type T with a single type parameter is a
/// subtype of itself and T is assignable to itself.
/// @author iefremov

import "../../../Utils/expect.dart";

class A<T> {
}

main() {
  A a = new A();
  Expect.isTrue(a is A);
  Expect.runtimeIsType<A>(a);
  A b = a;
  a = new A();
  Expect.isFalse(identical(a, b));

  A<int> n = new A<int>();
  Expect.isTrue(n is A<int>);
  Expect.runtimeIsType<A<int>>(n);
  Expect.isTrue(a is A);
  Expect.runtimeIsType<A>(a);

  a = n;
  n = new A();

  List l1 = new List.empty();
  Expect.isTrue(l1 is List);
  Expect.runtimeIsType<List>(l1);
  List l2 = l1;
  l1 = new List.empty();

  List<int> li1 = new List<int>.empty();
  Expect.isTrue(li1 is List<int>);
  Expect.runtimeIsType<List<int>>(li1);
  List li2 = li1;
  li1 = new List<int>.empty();

  List<List<List>> ll1 = new List<List<List>>.empty();
  Expect.isTrue(ll1 is List<List<List>>);
  Expect.runtimeIsType<List<List<List>>>(ll1);
  List ll2 = ll1;
  ll1 = new List<List<List>>.empty();

  A<Map<List, List<Map<Object, Map>>>> z = new A<Map<List, List<Map<Object, Map>>>>();
  Expect.isTrue(z is A<Map<List, List<Map<Object, Map>>>>);
  Expect.runtimeIsType<A<Map<List, List<Map<Object, Map>>>>>(z);
  A<Map<List, List<Map<Object, Map>>>> z2 = z;
  z = new A<Map<List, List<Map<Object, Map>>>>();
}

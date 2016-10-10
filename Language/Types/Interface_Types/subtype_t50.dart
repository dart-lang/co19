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
 * @description Checks that a function type t1 is not assignable to a function
 * type t2 only if t1 <: t2
 * @compile-error
 * @author sgrekhov@unipro.ru
 */

class A {}
class A1 {}
class A2 {}
class B implements A, A1, A2 {}
class C implements B {}
class D implements C {}

typedef B func(Object o);
typedef A f1(int i, D d, Map<int, num> m, var x,
             [var ox, D od, List<num> ol, bool obool]);

B f01(int i, B b, Map<int, num> m, var x,
      [var ox, B ob, List<num> ol, bool obool]) {}

C f11(num i, A b, Map<Object, Object> m, var x) {}

main() {
  f1 fvar = f11;
}

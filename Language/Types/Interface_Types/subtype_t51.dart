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
 * T is a type parameter and S is a type parameter bound (T and S are complex
 * generics). Checks their assignability (no static type warnings) as
 * well.
 * @issue 27556
 * @static-clean
 * @author sgrekhov@unipro.ru
 */

class I<T> {}
class J<T> extends I<T> {}
class K extends J {}
class C implements K {}

typedef J f(J<K> i);
typedef K f_1(I<J> i);
typedef C f_2(J<J> i);

class Checker_I<T extends I<f>> implements I {
}

main() {
  new Checker_I<I<f>>();
  new Checker_I<I<f_1>>();
  new Checker_I<I<f_2>>();
}

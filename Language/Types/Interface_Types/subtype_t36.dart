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
 * @description Checks that two generic types are not assignable even if just
 * one type argument is not assignable. Using complex function types as type
 * arguments.
 * @compile-error
 * @author iefremov
 * @reviewer rodionov
 */

class I {}
class J extends I {}
class K extends J {}
class C implements K {}

typedef Map<List, List<Map<num,List>>> complexFunction_t1();
typedef t1_1();
typedef Map<List<int>, List> t1_2();
typedef Map<List<int>, List<Map>> t1_3();
typedef Map<List<complexFunction_t1>,
            List<Map<int,
                     List<Map<complexFunction_t1,
                              complexFunction_t2>>>>> t1_4();

typedef badFunction(int x); //not assignable to complexFunction_t1

typedef complexFunction_t1 complexFunction_t2(
                                              complexFunction_t1 f1,
                                              complexFunction_t1 f2);
typedef t1_1 t2_1(t1_2 f1, badFunction f2); //not assignable to complexFunction_t2 because of badFunction

typedef K typeParameter1(J j, complexFunction_t1 f1, [num i, complexFunction_t2 f2]);
//      <=>              <=>  <=>                     <=>    <=/=>
typedef C typeParameter2(K j, t1_4 f1,               [int i, t2_1 f2]);


class Generic<G> {}

Generic<typeParameter2> f() {}

main() {
  Generic<typeParameter1> g = f();
}

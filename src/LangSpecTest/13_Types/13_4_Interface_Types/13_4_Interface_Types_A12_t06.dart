/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A type T is more specific than a type S, written T << S, if one of the following conditions is met:
 * T is S.
 * T is ⊥
 * S is Dynamic.
 * S is a direct supertype of T.
 * T is a type variable and S is the upper bound of T.
 * T is of the form I<T1, ..., Tn > and S is of the form I <S1, ..., Sn> and Ti << Si 1 <= i <= n.
 * T << U and U << S.
 * T is a subtype of S, written T <: S, iff [⊥/Dynamic]T << S.
 * A type T may be assigned to a type S, written T <=> S, if either T <: S or S <: T .
 * @description Checks that two generic types are not assignable even if just one type argument is not assignable.
 * Using complex function types as type arguments.
 * @static-type-error
 * @author iefremov
 * @reviewer rodionov
 */

interface I {}
interface J extends I {}
interface K extends J {}
class C implements K {}

typedef Map<List, List<Map<num,List>>> complexFunction_t1();
typedef t1_1();
typedef Map<List<int>, List> t1_2();
typedef Map<List<int>, List<Map>> t1_3();
typedef Map<List<complexFunction_t1>, List<Map<int, List<Map<complexFunction_t1, complexFunction_t2>>>>> t1_4();

typedef badFunction(int x); //not assignable to complexFunction_t1

typedef complexFunction_t1 complexFunction_t2(complexFunction_t1 f1, complexFunction_t1 f2);
typedef t1_1 t2_1(t1_2 f1, badFunction f2); //not assignable to complexFunction_t2 because of badFunction

typedef K typeParameter1(J j, complexFunction_t1 f1, [num i, complexFunction_t2 f2]);
//      <=>              <=>  <=>                     <=>    <=/=>
typedef C typeParameter2(K j, t1_4 f1,               [int i, t2_1 f2]);


class Generic<G> {}

main() {
  Generic<typeParameter1> g = new Generic<typeParameter2>();
}

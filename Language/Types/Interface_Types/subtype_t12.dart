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
 * @description Checks that a function type t1 is assignable (no static
 * warnings) to a function type t2 only if t1 <: t2 where t1 and t2 are
 * quite complex: non-dynamic return type plus a bunch of formal and optional
 * parameters. Subtypes of a function type described according to
 * (Types/Function Types).
 * @author iefremov
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

//fewer optional parameters
typedef B f1_1(int i, B b, Map<int, num> m, var x,
               [var ox, B ob, List<num> ol]);
typedef B f1_2(int i, B b, Map<int, num> m, var x, [var ox, B ob]);
typedef B f1_3(int i, B b, Map<int, num> m, var x, [var ox]);
typedef B f1_4(int i, B b, Map<int, num> m, var x);

B f01(int i, B b, Map<int, num> m, var x,
      [var ox, B ob, List<num> ol, bool obool]) {}
D f02(int i, D b, Map<num, num> m, var x,
      [var ox, D ob, List<Object> ol, bool obool]) {}
C f03(num i, A b, Map<Object, Object> m, var x,
      [var ox, A2 ob, List ol, Object obool]) {}
A f04(num i, A b, Map<Object, Object> m, var x,
      [var ox, A2 ob, List ol, Object obool]) {}
A f05(num i, A b, Map<Object, Object> m, var x,
      [var ox, A2 ob, List ol, Object obool, var more1]) {}
A f06(num i, A b, Map<Object, Object> m, var x,
      [var ox, A2 ob, List ol, Object obool, var more1, int more2]) {}

B f21(int i, B b, Map<int, num> m, var x,
      [var ox, B ob, List<num> ol, bool obool]) {}
B f22(int i, B b, Map<int, num> m, var x,
      [var ox, B ob, List<num> ol, bool obool]) {}
B f23(int i, B b, Map<int, num> m, var x,
      [var ox, B ob, List<num> ol, bool obool]) {}
B f24(int i, B b, Map<int, num> m, var x,
      [var ox, B ob, List<num> ol, bool obool]) {}

main() {
  //functions on the right are subtypes of f1
  f1 fvar = f01;
  fvar = f02;
  fvar = f03;
  fvar = f04;
  fvar = f05;
  fvar = f06;

  //function on the right is a subtype of f1_*
  f1_1 fvar_1 = f21;
  f1_2 fvar_2 = f22;
  f1_3 fvar_3 = f23;
  f1_4 fvar_4 = f24;
}

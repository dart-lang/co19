/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The function type (T1, ... Tn, [Tx1 x1, ..., Txk xk]) -> T is a subtype of the function
 * type (S1, ..., Sn, [Sy1 y1, ..., Sym ym ]) -> S, if all of the following conditions are met:
 * 1. Either S is void, or T <=> S.
 * 2. For all i 1 <= i <= n, Ti <=> Si.
 * 3. k >= m and xi = yi , for each i in 1..m.
 * 4. For all y, {y1 , . . . , ym} Sy <=> Ty
 * @description Positive checks against function types with no arguments: S is some generic, T is some other type assignable to S.
 * @author iefremov
 */

typedef t1();
typedef void t2();
typedef int t3();
typedef String t4();
typedef double t5();
typedef Object t6();
typedef t1 t7();
typedef List t8();
typedef List<int> t9();
typedef Map<int, List<List<List>>> t10();
typedef t10 t11();
typedef t11 t12();
typedef num t13();
typedef List<B> t14();
typedef Map t15();
typedef Map<num, Object> t16();

interface A{}
interface B extends A{}
interface C extends B{}
interface D extends C{}

main() {
  //() -> T is () -> List
  Expect.isTrue(List f(){} is t8);
  Expect.isTrue(List<int> f(){} is t8);
  Expect.isTrue(List<double> f(){} is t8);
  Expect.isTrue(List<Object> f(){} is t8);
  Expect.isTrue(List<String> f(){} is t8);
  Expect.isTrue(List<Map<int, Map>> f(){} is t8);
  Expect.isTrue(List<Map<int, t8>> f(){} is t8);
  Expect.isTrue(List<Map<t8, t8>> f(){} is t8);
  Expect.isTrue(List<t8> f(){} is t8);

  //() -> T is () -> List<int>
  Expect.isTrue(List f(){} is t9);
  Expect.isTrue(List<int> f(){} is t9);
  Expect.isTrue(List<Object> f(){} is t9);

  //() -> T is () -> List<B>
  Expect.isTrue(List f(){} is t14);
  Expect.isTrue(List<Object> f(){} is t14);
  Expect.isTrue(List<A> f(){} is t14);
  Expect.isTrue(List<B> f(){} is t14);
  Expect.isTrue(List<C> f(){} is t14);
  Expect.isTrue(List<D> f(){} is t14);

  Expect.isTrue(Map f(){} is t15);
  Expect.isTrue(Map<Object, Object> f(){} is t15);
  Expect.isTrue(Map<Object, int> f(){} is t15);
  Expect.isTrue(Map<int, Object> f(){} is t15);
  Expect.isTrue(Map<int, int> f(){} is t15);
  Expect.isTrue(Map<int, List<int>> f(){} is t15);
  Expect.isTrue(Map<List<int>, List<int>> f(){} is t15);
  Expect.isTrue(Map<List<int>, t15> f(){} is t15);
  Expect.isTrue(Map<t15, t15> f(){} is t15);
  Expect.isTrue(Map<t15, t14> f(){} is t15);

  Expect.isTrue(Map<num, Object> f(){} is t16);
  Expect.isTrue(Map<int, Object> f(){} is t16);
  Expect.isTrue(Map<double, Object> f(){} is t16);
  Expect.isTrue(Map<double, int> f(){} is t16);
  Expect.isTrue(Map<double, num> f(){} is t16);
  Expect.isTrue(Map<int, A> f(){} is t16);
  Expect.isTrue(Map<num, B> f(){} is t16);
  Expect.isTrue(Map<num, List> f(){} is t16);
  Expect.isTrue(Map<num, Map> f(){} is t16);
  Expect.isTrue(Map<num, Map<int, int>> f(){} is t16);
  Expect.isTrue(Map<num, Map<List, List<int>>> f(){} is t16);

}

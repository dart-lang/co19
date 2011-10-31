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
 * @description Checks that function type t1 is a subtype of function type t2 where t1 and t2 are quite complex:
 * non-dynamic return type + bunch of formal and optional parameters.
 * @author iefremov
 */

interface A{}
interface A1{}
interface A2{}
interface B extends A, A1, A2{}
interface C extends B{}
interface D extends C{}

typedef B func(Object o);
typedef B f1(int i, B b, Map<int, num> m, var x, [var ox, B ob, List<num> ol, bool obool]);


main() {
  Expect.isTrue(B f(int i, B b, Map<int, num> m, var x, [var ox, D ob, List<num> ol, bool obool]){} is f1);
  Expect.isTrue(D f(int i, D b, Map<int, int> m, func x, [func ox, D ob, List<int> ol, bool obool]){} is f1);
  Expect.isTrue(C f(num i, A b, Map<Object, Object> m, var x, [var ox, A2 ob, List ol, Object obool]){} is f1);

  Expect.isTrue(C f(num i, A b, Map<Object, Object> m, var x){} is f1);
  Expect.isTrue(C f(num i, A b, Map<Object, Object> m, var x, [var ox]){} is f1);
  Expect.isTrue(C f(num i, A b, Map<Object, Object> m, var x, [var ox, A2 ob]){} is f1);
  Expect.isTrue(C f(num i, A b, Map<Object, Object> m, var x, [var ox, A2 ob, List ol]){} is f1);

  Expect.isTrue(A f(num i, A b, Map<Object, Object> m, var x, [var ox, A2 ob, List ol, Object obool]){} is f1);
}

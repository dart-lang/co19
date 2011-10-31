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
 * @description Checks that function type t1 is not a subtype of function type t2 if only one optional parameter of
 * one type is not assignable to the corresponding parameter of another type.
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
                                                                  //func vs B
  Expect.isFalse(B f(double i, B b, Map<int, num> m, var x, [var ox, func ob, List<num> ol, bool obool]){} is f1);
                                                                             //B vs num
  Expect.isFalse(D f(int i, func b, Map<int, int> m, func x, [func ox, D ob, List<B> ol, bool obool]){} is f1);
                                                                                     //int vs bool
  Expect.isFalse(C f(num i, A b, Map<Object, func> m, var x, [var ox, A2 ob, List ol, int obool]){} is f1);
}

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
 * @description Positive checks against function types with no arguments: S is some type, T is some other type assignable to S.
 * @author iefremov
 */

typedef t1();
typedef Object t6();
typedef num t13();

main() {
  //() -> T is () -> Dynamic
  Expect.isTrue(void f(){} is t1);
  Expect.isTrue(int f(){} is t1);
  Expect.isTrue(String f(){} is t1);
  Expect.isTrue(double f(){} is t1);
  Expect.isTrue(Object f(){} is t1);
  Expect.isTrue(t1 f(){} is t1);
  Expect.isTrue(List f(){} is t1);
  Expect.isTrue(List<int> f(){} is t1);
  Expect.isTrue(Map<int, List<List<List>>> f(){} is t1);
  Expect.isTrue(t10 f(){} is t1);
  Expect.isTrue(t11 f(){} is t1);

  //() -> T is () -> Object
  Expect.isTrue(int f(){} is t6);
  Expect.isTrue(String f(){} is t6);
  Expect.isTrue(double f(){} is t6);
  Expect.isTrue(Object f(){} is t6);
  Expect.isTrue(List f(){} is t6);
  Expect.isTrue(List<int> f(){} is t6);
  Expect.isTrue(Map<int, List<List<List>>> f(){} is t6);

  //() -> T is () -> num
  Expect.isTrue(int f(){} is t13);
  Expect.isTrue(double f(){} is t13);
  Expect.isTrue(num f(){} is t13);
}

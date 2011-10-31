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
 * @description Positive checks against function types with no arguments: S is some type, T is Dynamic (assignable to S).
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


void checkAll(Function f) {
  Expect.isTrue(f is t1);
  Expect.isTrue(f is t2);
  Expect.isTrue(f is t3);
  Expect.isTrue(f is t4);
  Expect.isTrue(f is t5);
  Expect.isTrue(f is t6);
  Expect.isTrue(f is t7);
  Expect.isTrue(f is t8);
  Expect.isTrue(f is t9);
  Expect.isTrue(f is t10);
  Expect.isTrue(f is t11);
  Expect.isTrue(f is t12);
}

main() {
  checkAll(f(){});
}

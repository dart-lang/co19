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
 * @description Checks that function type t1 is not a subtype of function type t2 if return types of t1 and t2
 * are not mutually assignable.
 * @author iefremov
 * @reviewer rodionov
 */

interface A {}
interface B {}

typedef int f1();
typedef A f3();
typedef List<A> f4();
typedef f1 f5();

main() {
  Expect.isFalse(double f() {} is f1);
  Expect.isFalse(bool f() {} is f1);
  Expect.isFalse(A f() {} is f1);
  Expect.isFalse(List<int> f() {} is f1);
  Expect.isFalse(f3 f() {} is f1);

  Expect.isFalse(double f() {} is f3);
  Expect.isFalse(bool f() {} is f3);
  Expect.isFalse(List<int> f() {} is f3);
  Expect.isFalse(f3 f() {} is f3);

  Expect.isFalse(double f() {} is f4);
  Expect.isFalse(bool f() {} is f4);
  Expect.isFalse(A f() {} is f4);
  Expect.isFalse(List<int> f() {} is f4);
  Expect.isFalse(f3 f() {} is f4);

  Expect.isFalse(double f() {} is f5);
  Expect.isFalse(bool f() {} is f5);
  Expect.isFalse(A f() {} is f5);
  Expect.isFalse(List<int> f() {} is f5);
  Expect.isFalse(f4 f() {} is f5);
}

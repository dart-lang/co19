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
 * @description Checks that function type t1 is not a subtype of function type t2 if a formal parameter
 * of t1 is not assignable to a corresponding parameter of t2 (both t1 and t2 have a single required formal parameter).
 * @author iefremov
 * @reviewer rodionov
 */

abstract class A {}
abstract class B {}

typedef f1(int a);
typedef f3(A a);
typedef f4(List<A> a);
typedef f5(f1 a);

main() {
  Expect.isFalse(f(double p) {} is f1);
  Expect.isFalse(f(bool p) {} is f1);
  Expect.isFalse(f(A p) {} is f1);
  Expect.isFalse(f(List<int> p) {} is f1);
  Expect.isFalse(f(f3 p) {} is f1);

  Expect.isFalse(f(double p) {} is f3);
  Expect.isFalse(f(bool p) {} is f3);
  Expect.isFalse(f(List<int> p) {} is f3);
  Expect.isFalse(f(f3 p) {} is f3);
  Expect.isFalse(f(B p) {} is f3);

  Expect.isFalse(f(double p) {} is f4);
  Expect.isFalse(f(bool p) {} is f4);
  Expect.isFalse(f(A p) {} is f4);
  Expect.isFalse(f(List<int> p) {} is f4);
  Expect.isFalse(f(List<B> p) {} is f4);
  Expect.isFalse(f(f3 p) {} is f4);

  Expect.isFalse(f(double p) {} is f5);
  Expect.isFalse(f(bool p) {} is f5);
  Expect.isFalse(f(A p) {} is f5);
  Expect.isFalse(f(List<int> p) {} is f5);
  Expect.isFalse(f(f4 p) {} is f5);
}

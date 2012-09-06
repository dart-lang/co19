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
 * @description Checks that this statement is true for function types with a single formal parameter
 * (interface, generic, function, Dynamic).
 * @author iefremov
 * @reviewer rodionov
 */

interface A {}
interface B extends A {}
interface C extends B {}
interface D extends C {}

typedef f1(B b);
typedef f2(C c);
typedef f3(int i);
typedef f4(var v);
typedef f5(Map m);
typedef f6(Map<int, num> m);
typedef f7(f1 f);
typedef f8(Object f);

typedef okWithF1_1(A a);
typedef okWithF1_2(B a);
typedef okWithF1_3(C a);
typedef okWithF1_4(D a);

main() {
  Expect.isTrue(f(A a) {} is f1);
  Expect.isTrue(f(B a) {} is f1);
  Expect.isTrue(f(C a) {} is f1);
  Expect.isTrue(f(D a) {} is f1);
  Expect.isTrue(f(Object a) {} is f1);
  Expect.isTrue(f(var a) {} is f1);

  Expect.isTrue(f(A a) {} is f2);
  Expect.isTrue(f(B a) {} is f2);
  Expect.isTrue(f(C a) {} is f2);
  Expect.isTrue(f(D a) {} is f2);
  Expect.isTrue(f(Object a) {} is f2);
  Expect.isTrue(f(var a) {} is f2);

  Expect.isTrue(f(num n) {} is f3);
  Expect.isTrue(f(int i) {} is f3);
  Expect.isTrue(f(Object a) {} is f3);
  Expect.isTrue(f(var a) {} is f3);

  Expect.isTrue(f(A a) {} is f4);
  Expect.isTrue(f(B a) {} is f4);
  Expect.isTrue(f(C a) {} is f4);
  Expect.isTrue(f(D a) {} is f4);
  Expect.isTrue(f(Object a) {} is f4);
  Expect.isTrue(f(var a) {} is f4);
  Expect.isTrue(f(num n) {} is f4);
  Expect.isTrue(f(int i) {} is f4);
  Expect.isTrue(f(Map a) {} is f4);
  Expect.isTrue(f(Map<List<Map<List, List<int>>>, List> a) {} is f4);
  Expect.isTrue(f(List a) {} is f4);
  Expect.isTrue(f(f8 a) {} is f4);
  Expect.isTrue(f(f7 a) {} is f4);

  Expect.isTrue(f(Map m) {} is f5);
  Expect.isTrue(f(Map<List, f8> m) {} is f5);
  Expect.isTrue(f(Object m) {} is f5);
  Expect.isTrue(f(var m) {} is f5);
  Expect.isTrue(f(Map<List, List> m) {} is f5);
  Expect.isTrue(f(Map<int, f8> m) {} is f5);

  Expect.isTrue(f(Map<num, num> m) {} is f6);
  Expect.isTrue(f(Map<int, int> m) {} is f6);
  Expect.isTrue(f(Map m) {} is f6);
  Expect.isTrue(f(Object m) {} is f6);
  Expect.isTrue(f(var m) {} is f6);

  Expect.isTrue(f(okWithF1_1 g) {} is f7);
  Expect.isTrue(f(okWithF1_2 g) {} is f7);
  Expect.isTrue(f(okWithF1_3 g) {} is f7);
  Expect.isTrue(f(okWithF1_4 g) {} is f7);

  Expect.isTrue(f(A a) {} is f8);
  Expect.isTrue(f(B a) {} is f8);
  Expect.isTrue(f(C a) {} is f8);
  Expect.isTrue(f(D a) {} is f8);
  Expect.isTrue(f(Object a) {} is f8);
  Expect.isTrue(f(var a) {} is f8);
  Expect.isTrue(f(num n) {} is f8);
  Expect.isTrue(f(int i) {} is f8);
  Expect.isTrue(f(Map a) {} is f8);
  Expect.isTrue(f(Map<List<Map<List, List<int>>>, List> a) {} is f8);
  Expect.isTrue(f(List a) {} is f8);
}

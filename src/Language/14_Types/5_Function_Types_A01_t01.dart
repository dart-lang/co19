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
 * @description Checks that this statement is true for function types with no arguments: S is void, T is any type.
 * Also checks their mutual assignability.
 * @static-warning
 * @author iefremov
 * @reviewer rodionov
 */

typedef void check_t();

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


class Checker<T> {
  Checker(f) {
    Expect.isTrue(f is check_t);
    //check assignability () -> S = () -> T
    check_t check1 = f;
    //vice versa () -> T = () -> S
    check_t void_func;
    T t = void_func;
  }
}

main() {
  new Checker<t1>  (f() {});
  new Checker<t2>  (void f() {});
  new Checker<t3>  (int f() {});
  new Checker<t4>  (String f() {});
  new Checker<t5>  (double f() {});
  new Checker<t6>  (Object f() {});
  new Checker<t7>  (t1 f() {});
  new Checker<t8>  (List f() {});
  new Checker<t9>  (List<int> f() {});
  new Checker<t10> (Map<int, List<List<List>>> f() {});
  new Checker<t11> (t10 f() {});
}

/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A type T is more specific than a type S, written T << S, if T is S.
 * T is a subtype of S, written T <: S, iff [⊥/Dynamic]T << S.
 * A type T may be assigned to a type S, written T <=> S, if either T <: S or S <: T.
 * @description Checks that function type T is a subtype of itself and
 * T is assignable to itself.
 * @author iefremov
 * @reviewer rodionov
 */

typedef void t1();
typedef num t2();
typedef t3();
typedef t4(var x);
typedef int t5(var x);
typedef String t6(var x, int y);
typedef t1 t7(t2 x, t3 y);
typedef t7 t8(t7 x, [t7 y]);
typedef void t9([var x]);
typedef int t10([int x]);
typedef List t11(int x, int y, List z, Map<String, Object> m);
typedef List t12(int x, [int y, List z, Map<String, Object> m]);
typedef List<Map<int, List<List<int>>>> t13(int x, var v, [int y, List z, Map<String, List<int>> m]);
typedef t13 t14(t13 a, [t13 b]);

class Checker<T> {
  Checker() {}
  
  check(T x) {
    Expect.isTrue(x is T);
    T t = x;
    check2(x);
  }

  check2(var x) {
    T t = x;
  }
}

main() {
  new Checker<t1>().check(void f() {});
  new Checker<t2>().check(num f() {});
  new Checker<t3>().check(f() {});
  new Checker<t4>().check(f(var x) {});
  new Checker<t5>().check(int f(var x) {});
  new Checker<t6>().check(String f(var x, int y) {});
  new Checker<t7>().check(t1 f(t2 x, t3 y) {});
  new Checker<t8>().check(t7 f(t7 x, [t7 y]) {});
  new Checker<t9>().check(void f([var x]) {});
  new Checker<t10>().check(int f([int x]) {});
  new Checker<t11>().check(List f(int x, int y, List z, Map<String, Object> m) {});
  new Checker<t12>().check(List f(int x, [int y, List z, Map<String, Object> m]) {});
  new Checker<t13>().check(List<Map<int, List<List<int>>>> f(int x, var v, [int y, List z, Map<String, List<int>> m]) {});
  new Checker<t14>().check(t13 f(t13 a, [t13 b]) {});
}
